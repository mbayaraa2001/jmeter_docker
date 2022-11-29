FROM jmeter-base

WORKDIR $JMETER_HOME
# Ports to be exposed from the container for JMeter Master
RUN mkdir scripts
COPY dotnetpiaThreadGroup.jmx /jmeter/bin/

EXPOSE 1099 60000
RUN sed -i "s/#server.rmi.ssl.disable=false/server.rmi.ssl.disable=true/g" /jmeter/bin/user.properties
RUN echo "client.rmi.localport=7000" >> /jmeter/bin/user.properties
RUN echo "server.rmi.localport=6000" >> /jmeter/bin/user.properties