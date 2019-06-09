#!/bin/bash

ES_HOME=/opt/module/elasticsearch-6.6.0
KIBANA_HOME=/opt/module/kibana

case $1 in
"start")
	for i in hadoop102 hadoop103 hadoop104
	do
		echo ========== start elasticSearch in $i ==========
		ssh $i "$ES_HOME/bin/elasticsearch >/dev/null 2>&1 &"
	done
	
	echo ========== start kibana in hadoop102 ==========
	nohup $KIBANA_HOME/bin/kibana >$KIBANA_HOME/logs/start.log 2>&1 &
	;;
"stop")
	echo ========== stop kibana in hadoop102 ==========
	ps -ef | grep $KIBANA_HOME | grep -v grep | awk '{print $2}' | xargs kill -9

	for i in hadoop102 hadoop103 hadoop104
	do
		echo ========== stop elasticSearch in $i ==========
		ssh $i "ps -ef | grep $ES_HOME | grep -v grep | awk '{print \$2}' | xargs kill -9" >/dev/null 2>&1
	done
	;;
*)
	echo "{start | stop}"
	;;
esac
	
