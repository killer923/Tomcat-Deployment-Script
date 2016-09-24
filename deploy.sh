control_c(){
	tomcatPid=`ps -ef | grep org.apache.catalina.startup.Bootstrap\ start |  grep -v "grep"| awk '{ printf $2 }'`
	sh shutdown.sh
	kill $tomcatPid
	echo 'Tomcat kill Signal Sent'
	exit
}

trap control_c SIGINT

export JPDA_ADDRESS=8000
export JPDA_TRANSPORT=dt_socket

sh catalina.sh jpda start
tail -f ../logs/catalina.out
