#!/bin/bash
docker-compose down -v
docker-compose up -d
sleep 30
echo "with all nodes up"
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 create /doesitwork allnodesup
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 get /doesitwork
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 rmr /doesitwork
echo "with dc2 dead"
docker-compose stop zookeeper-4 zookeeper-5 zookeeper-6
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 create /doesitwork dc2isdead
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 get /doesitwork
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 rmr /doesitwork
echo "with dc2 dead plus one node"
docker-compose stop zookeeper-7
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 create /doesitwork dc2isdead-plusonenode
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 get /doesitwork
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 rmr /doesitwork
echo "with dc2 deadi plus two node"
docker-compose stop zookeeper-8
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 create /doesitwork dc2isdead-plustwonode
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 get /doesitwork
docker-compose exec zookeeper-1 zookeeper-shell zookeeper-1:2181 rmr /doesitwork
