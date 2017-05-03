Linkedin Kafka Monitor tool for end-end metrics

Base Image : centos

        docker pull vk927/kafka-monitor

Run the fallowing docker command 

        docker run -it -p 8000:8000 -p 8778:8778 -p 2181:2181 -p 9092:9092 vk927/kafka-monitor

after logging into conatiner , run the fallowing command using your own kafka brokers and zookepers IP

       ./kafka-monitor/bin/end-to-end-test.sh --topic test --broker-list 172.30.0.44:9092,172.30.0.43:9092,172.30.0.42:9092 --zookeeper 172.30.0.45:2181

docker hub URL
https://hub.docker.com/r/vk927/kafka-monitor/
