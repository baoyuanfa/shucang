#!/bin/bash

case $1 in
	"start")
		echo "========== start dfs in hadoop102 =========="
		/opt/module/hadoop-2.7.2/sbin/start-dfs.sh
	
		echo "========== start yarn in hadoop103 =========="
		ssh hadoop103 "start-yarn.sh"

		echo "========== start historyServer in hadoop104 =========="
                ssh hadoop104 "mr-jobhistory-daemon.sh start historyserver"
		;;
	"stop")
		echo "========== stop historyServer in hadoop104 =========="
                ssh hadoop104 "mr-jobhistory-daemon.sh stop historyserver"

                echo "========== stop yarn in hadoop103 =========="
                ssh hadoop103 "stop-yarn.sh"

                echo "========== stop dfs in hadoop102 =========="
                /opt/module/hadoop-2.7.2/sbin/stop-dfs.sh
		;;
	*)
		echo "{start | stop}"
		;;
esac
