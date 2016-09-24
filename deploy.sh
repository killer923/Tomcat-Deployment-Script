debug=false
while getopts ":d" opt; do
  case $opt in
    d)
      debug=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

control_c(){
	tomcatPid=`ps -ef | grep org.apache.catalina.startup.Bootstrap\ start |  grep -v "grep"| awk '{ printf $2 }'`
	sh shutdown.sh
	kill $tomcatPid
	echo 'Tomcat kill Signal Sent'
	exit
}

trap control_c SIGINT


if $debug; then
	echo 'Starting in Debug Mode...'
	export JPDA_ADDRESS=8000
	export JPDA_TRANSPORT=dt_socket
	sh catalina.sh jpda start
else
	echo 'Starting normally...'
	sh catalina.sh start
fi

tail -f ../logs/catalina.out
