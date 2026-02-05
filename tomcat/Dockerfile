FROM tomcat:11

ARG SERVER_XML_FILE=server-standalone.xml

COPY conf/$SERVER_XML_FILE conf/server.xml
COPY msg.war webapps/msg.war

ENV CATALINA_OPTS="-XX:MaxRAMPercentage=75"

EXPOSE 8080 4000
