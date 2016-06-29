FROM centos
MAINTAINER vk927@nyu.edu

#ENRTYPOINT [ "end-to-end-test.sh" ]

RUN yum -y update && \
    yum  install -y  java-1.7.0-openjdk* && \
    yum  install -y git && \
    yum  install -y wget && \
    yum  install -y unzip && \
    wget https://services.gradle.org/distributions/gradle-2.3-bin.zip && \
    unzip gradle-2.3-bin.zip

ENV JAVA_HOME=/lib/jvm/java-1.7.0-openjdk  \
    GRADLE_HOME=/gradle-2.3  \
    PATH=$PATH:$JAVA_HOME/bin:$GRADLE/bin

RUN git clone https://github.com/linkedin/kafka-monitor.git && \
    cd kafka-monitor && \
    ./gradlew jar

EXPOSE 8000 8778 22 2181 9092

ENTRYPOINT [ "/kafka-monitor/bin/end-to-end-test.sh" ]

CMD ["--topic","test","--broker-list","localhost:9092","--zookeeper","localhost:2181"]
