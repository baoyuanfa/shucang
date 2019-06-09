#!/bin/bash

case $1 in
"start"){
	for i in hadoop102 hadoop103 hadoop104
	do
		echo ========== start kafka server on $i ==========
		ssh $i "export JMX_PORT=9988 && /opt/module/kafka/bin/kafka-server-start.sh -daemon /opt/module/kafka/config/server.properties"
	done
};;
"stop"){
	for i in hadoop102 hadoop103 hadoop104
	do
		echo ========== stop kafka server on $i ==========
		ssh $i "/opt/module/kafka/bin/kafka-server-stop.sh"
	done
};;
*){
	echo "{start | stop}"
};;
esac
