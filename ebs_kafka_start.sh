
echo $KAFKA_HOME
$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties &
echo "*** waiting for 10 secs to give ZooKeeper time to start up"
sleep 10
echo "# ============================================================================ #"
echo "                         S t a r t i n g   K a f k a"
echo "# ============================================================================ #"
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties &
echo "*** waiting for 10 secs to give Kafka time to start up"
sleep 20
/opt/kafka_2.11-0.10.0.0/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 4 --topic bulk_request
/opt/kafka_2.11-0.10.0.0/bin/kafka-topics.sh --list --zookeeper localhost:2181