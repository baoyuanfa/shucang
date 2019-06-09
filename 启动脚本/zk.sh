#!/bin/bash

case $1 in
"start")
	for i in hadoop102 hadoop103 hadoop104
	do
		echo "========== start zkServer on $i =========="
		ssh $i "/opt/module/zookeeper-3.4.10/bin/zkServer.sh start"
	done
	;;
"stop")
	for i in hadoop102 hadoop103 hadoop104
	do
		echo "========== stop zkServer on $i =========="
		ssh $i "/opt/module/zookeeper-3.4.10/bin/zkServer.sh stop"
	done
	;;
*)
	echo "please input {start | stop}"
esac