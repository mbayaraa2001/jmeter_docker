FROM jmeter-base

WORKDIR $JMETER_HOME
# Ports to be exposed from the container for JMeter Master
RUN mkdir scripts

EXPOSE 1099 60000
COPY rmi_keystore.jks /jmeter/
RUN sed -i "s/#server.rmi.ssl.disable=false/server.rmi.ssl.disable=true/g" /jmeter/bin/user.properties
RUN echo "server.rmi.localport=6000" >> /jmeter/bin/user.properties
