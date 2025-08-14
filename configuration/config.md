## Starting kafka server

To start a kafka cluster using KRaft mode follow those steps

#### step 1: Generate cluster uuid

Since there is no Zookeeper to manage the clusters, we need to generate a uuid for our cluster:

```bash
KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"
```
this command will generate a uuid and store it on shell variable named "KAFKA_CLUSTER_ID", you can see the value of this variable using the following command:


```bash
( set -o posix ; set ) | grep "KAFKA_CLUSTER_ID"
```

After that we need to format log directory, which mean that you are telling the kafka running on your machine to act like a broker (receive read/write request), this command also init log.dirs location where kafka will store data including topic partitions, broker metadat, offsets and internal logs.

for the --standalone it's telling kafka that you are going to creat only 1 brokers (which is at the same time a controller in your machine), using this on dev/testing phases. In oppsite to --cluster mode to be used for production mode, having more brokers accross multiple machines.

for -t $KAFKA_CLUSTER_ID you are justing binding the storage created to that id already generated.

```bash
bin/kafka-storage.sh format --standalone [--cluster] -t $KAFKA_CLUSTER_ID -c config/server.properties
```

you can check the created directory:

```bash
ls /tmp/kraft-combined-logs
```

you can find metadata including cluster id and node id on this file:

```bash
cat /tmp/kraft-combined-logs/meta.properties
```

Finally you can run the kafka server:

```bash
bin/kafka-server-start.sh config/server.properties
```

for topic related tasks run the following to discover more about the binary provided

```bash
bin/kafka-topics.sh --help
```