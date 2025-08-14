## 1.What is kafka?

Kafka is an open source platform for event streaming

## 2.what is event streaming?

Event streaming is a way of continuously capturing, storing, processing, and delivering streams of events in real time. think of an event as anything that happen in your system (example : system commands beeing executed, web application log messages...)


## 3.How does Kafka work

kafka is a "distributed system consisting of servers and clients that communicate via a high-performance TCP network protocol." according to the original doc.

### 3.1 Servers

That form the kafka cluster (see it in the next section), there is 2 type of servers the first is a broker (kafka server) and the second one is Kraft (Kafka raft metadata mode)

### 3.2 Clients

read, write, and process streams of events from kafka servers

## 4.Kafka main components explained

### 4.1 Cluster

Is a set of brokers working together to store and serve data.

### 4.2 Broker

Is a single kafka server that handle read/write requests and store data.

### 4.3 topic

Is something like a youtube channel (but instead of serving videos as contents it serve other data format json for example) where you can read (acting like a consumer) or write (acting like a producer) from it.

### 4.4 partition

The definition is an ordered, immutable sequence of messages within a topic, that mean every topic can have 1 or multiple partitions used to store messages.

### 4.5 producer

the one that will send a write request to the broker in order to send and save a message (event) in a topic

### 4.6 consumer

the one that will send a read request to the broker in order to get messages from a topic, it only consume event from the subscribed topics.

### 4.7 consumer group

Set of consumers working together to read from a topic

### 4.8 offset

a unique number for each message (event) in a partition


## Here is a schema that show how kafka works

