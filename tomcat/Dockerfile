FROM tomcat:11

ARG SERVER_XML_FILE=server-standalone.xml

COPY conf/$SERVER_XML_FILE conf/server.xml
COPY conf/logging.properties conf/logging.properties
COPY lib/derbyclient.jar lib/derbyclient.jar
COPY msg.war webapps/msg.war

RUN echo "org.apache.tomcat.util.digester.PROPERTY_SOURCE=org.apache.tomcat.util.digester.ServiceBindingPropertySource,org.apache.tomcat.util.digester.EnvironmentPropertySource" >> conf/catalina.properties

ENV CATALINA_OPTS="-XX:MaxRAMPercentage=75"

EXPOSE 8080 4000