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

### 4.1 