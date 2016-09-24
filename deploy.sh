control_c(){
	tomcatPid=`ps -ef | grep org.apache.catalina.startup.Bootstrap\ start |  grep -v "grep"| awk '{ printf $2 }'`
	sh shutdown.sh
	kill $tomcatPid
	echo 'Tomcat kill Signal Sent'
	exit
}

trap control_c SIGINT

sh startup.sh
tail -f ../logs/catalina.out
