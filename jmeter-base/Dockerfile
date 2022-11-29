FROM openjdk:latest

ENV TZ="Asia/Ulaanbaatar"
CMD ["/bin/bash"]
ENV JAVA_HOME=/usr/java/openjdk-18
ENV PATH=/usr/java/openjdk-18/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV JAVA_VERSION=18.0.2.1
RUN microdnf install --nodocs \
wget \
libyaml \
&& microdnf clean all \
&& rm -rf /var/cache/yum

RUN wget https://espejito.fder.edu.uy/apache/jmeter/binaries/apache-jmeter-5.5.tgz
RUN tar -xvzf apache-jmeter-5.5.tgz
RUN rm apache-jmeter-5.5.tgz

RUN mv apache-jmeter-5.5 /jmeter

ENV JMETER_HOME /jmeter

# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH
COPY rmi_keystore.jks /jmeter/bin/