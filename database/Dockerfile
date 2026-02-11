FROM eclipse-temurin:25-jdk-noble

RUN mkdir /var/derby
ADD ./derby /var/derby
WORKDIR /var/derby
RUN /var/derby/init.sh

EXPOSE 1527

CMD ["bash", "-c", "./run-db.sh"]
