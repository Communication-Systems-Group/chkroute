#!/bin/bash
GEOSERVER=http://measure-vm.csg.uzh.ch/chkrouteReceiver/chkrouteReceiver?ipv4=
#GEOSERVER=http://130.60.156.210/index.php?ipv6=

command -v traceroute >/dev/null 2>&1 || { echo >&2 "traceroute is required but it's not installed.  Aborting."; exit 1; }

traceroute -q 1 -n $1 | awk -F" " '{ if(NR!=1) print $2 }' > tmp

#traceroute -q 1 -n $1 | awk -F":" '{ if(NR!=1) print $2; }' | grep -v pmtu | awk -F" " '{ print $1; }' > $TMPFILE

echo -n 'Hop'
echo -ne '\t'
echo -n 'Host'
echo -ne '\t\t'
echo -n 'Country'
echo -ne '\t\t'
echo -n 'Compliant'
echo -ne '\t'
echo -n 'AS No'
echo -ne '\t\t'
echo 'Description'
echo '-----------------------------------------------------------------------------------'

k=1
while read line;do
	if [ "$line" = '*' ]; then
		echo -ne '\e[33m'
		echo -ne $k'\t'
		echo -e '*\t\tUnknown\t\tUnknown\t\tUnknown\t\tUnknown'
	else
		RESULT=`curl -s $GEOSERVER$line | tr -d '\n'`
		COUNTRY=`echo $RESULT | awk -F"," '{ print $1 }'`
		COMPLIANT=`echo $RESULT | awk -F"," '{ print $2 }'`
		AS=`echo $RESULT | awk -F"," '{ print $3 }'`
		DESC=`echo $RESULT | awk -F"," '{ print $4, $5 }'`

		if [ $COMPLIANT = "Y" ]; then
			echo -ne "\e[32m"
		elif [ $COMPLIANT = "N" ]; then
			echo -ne "\e[31m"
		else
			echo -ne "\e[33m"
		fi

		echo -ne $k'\t'
		echo -n $line
		if [ ${#line} -lt 8 ]; then
			echo -ne "\t"
		fi
		echo -ne "\t"
		echo -n $COUNTRY
		echo -ne "\t\t"
		echo -n $COMPLIANT
		echo -ne "\t\t"
		echo -n $AS
		echo -ne "\t"
                if [ ${#AS} -lt 8 ]; then
                        echo -ne "\t"
                fi
		echo $DESC
		#RESULT=`curl -s $GEOSERVER$line | tr -d '\n' | awk -F"," '{ print $1,"\t", $2 }'`
		#echo $RESULT
		#curl -s http://localhost/index.php?ipv4=$line | tr -d '\n' | awk '{ if($1 == "") print "Unknown"; else print $1 }'
        	#curl -s http://localhost/index.php?ipv4=$line | tr -d '\n' | awk '{ if ($1 == "\n") print 'Unknown'; else print $0 }'
	fi
#echo $line
        k=$(($k+1))
done < tmp

echo -e "\e[0m"

echo "(c) Daniel Dönni"
echo "Results based on Maxmind GeoLite and potaroo.net"

#curl http://localhost/index.php?ipv4=$LINE;


