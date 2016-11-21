# Kafka and Zookeeper

FROM java:openjdk-8-jre

ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.10.0.0
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"


# Install Kafka, Zookeeper and other needed apps
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y zookeeper wget supervisor dnsutils net-tools vim telnet && \
    apt-get clean && \
    wget -q http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt && \
    rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz

ADD server.properties /opt/kafka_2.11-0.10.0.0/config/server.properties
ADD zookeeper.properties /opt/kafka_2.11-0.10.0.0/config/zookeeper.properties
ADD ebs_kafka_start.sh /opt/kafka_2.11-0.10.0.0/bin/ebs_kafka_start.sh
ADD wm_kafka_start.sh /opt/kafka_2.11-0.10.0.0/bin/wm_kafka_start.sh
ADD wm_create_topics.sh /opt/kafka_2.11-0.10.0.0/bin/wm_create_topics.sh
RUN chmod 755 /opt/kafka_2.11-0.10.0.0/bin/ebs_kafka_start.sh
RUN chmod 755 /opt/kafka_2.11-0.10.0.0/bin/wm_kafka_start.sh
RUN chmod 755 /opt/kafka_2.11-0.10.0.0/bin/wm_create_topics.sh


# Supervisor config
RUN mkdir /var/log/supervisord && \
    chmod 755 /var/log/supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#data volume
VOLUME ["/kafka"]

# 2181 is zookeeper, 9092 is kafka
EXPOSE 2181
EXPOSE 9092
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

