# Examples of Tomcat clusters

Examples used to write my wiki page on [Tomcat clustering](https://www.jtips.info/Tomcat/Cluster).

## Docker Compose

### Build the images

```
docker build --tag jtips/tomcat ./tomcat
docker build --tag jtips/tomcat:simple --build-arg=SERVER_XML_FILE=server-simple.xml ./tomcat
docker build --tag jtips/tomcat:static --build-arg=SERVER_XML_FILE=server-static.xml ./tomcat
docker build --tag jtips/tomcat:backup --build-arg=SERVER_XML_FILE=server-backup.xml ./tomcat
docker build --tag jtips/tomcat:dns    --build-arg=SERVER_XML_FILE=server-dns.xml    ./tomcat

docker build --tag jtips/derby ./database
```

### Run the services

Run with 3 standalone nodes without clustering (default `server.xml`)

```
docker compose --file docker/docker-compose.yml up
```
=> no sync

```
docker compose --file docker/docker-compose-simple.yml up
```
=> sync OK

```
docker compose --file docker/docker-compose-backup.yml up
```
=> sync OK

```
docker compose --file docker/docker-compose-static.yml up
```
=> sync OK

```
docker compose --file docker/docker-compose-dns.yml up
```
=> sync OK

## Kubernetes

### Certificates

Prepare certificate to avoid browser warning

```
mkdir .tls
mkcert -install
mkcert -key-file .tls/minikube.local-key.pem -cert-file .tls/minikube.local.pem *.jtips.local
```

### Initialize Minikube cluster

```
minikube start
kubectl create secret tls tls-key --key .tls/minikube.local-key.pem --cert .tls/minikube.local.pem
kubectl apply -f k8s/cluster-config.yaml
minikube addons enable ingress
kubectl apply -f k8s/ingress.yaml
kubectl apply -f k8s/deploy-db.yaml
```

### Create images

```
minikube image build --tag jtips/tomcat ./tomcat
minikube image build --tag jtips/tomcat:simple --build-opt="build-arg=SERVER_XML_FILE=server-simple.xml" ./tomcat
minikube image build --tag jtips/tomcat:dns    --build-opt="build-arg=SERVER_XML_FILE=server-dns.xml"    ./tomcat
minikube image build --tag jtips/tomcat:k8s    --build-opt="build-arg=SERVER_XML_FILE=server-k8s.xml"    ./tomcat
minikube image build --tag jtips/tomcat:backup --build-opt="build-arg=SERVER_XML_FILE=server-backup.xml" ./tomcat

minikube image build --tag jtips/derby ./database
```

### Create Tomcat service

```
kubectl apply -f k8s/service-tomcat.yaml
```

### Deploy Tomcat

* Standalone

```
kubectl apply -f k8s/deploy-tomcat.yaml
```
=> no sync

* Multicast cluster

```
kubectl apply -f k8s/deploy-tomcat-simple.yaml
```
=> sync OK

The same with the BackupManager

```
kubectl apply -f k8s/deploy-tomcat-backup.yaml
```
=> sync OK

* DNS based membership

```
kubectl apply -f k8s/deploy-tomcat-dns.yaml
```
=> sync OK

* API based membership

```
kubectl apply -f k8s/rbac.yaml
kubectl apply -f k8s/deploy-tomcat-k8s.yaml
```
=> sync OK
