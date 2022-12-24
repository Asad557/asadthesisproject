#!/bin/bash

sample=$(cat sample.txt)
COUNTER=1
count=1000

	while [  $COUNTER -lt $count ]; do
		echo The count is $COUNTER
		docker exec kalyan-figlet figlet $sample #>> /dev/null
               # docker stats --no-stream | grep 06b0ec5a17db | tr -s ' ' >> metrics/getmetrics
               # cat metrics/getmetrics |  cut -d' ' -f3 | sed 's/%//' >> metrics/allvalues
               # sed '1d' metrics/allvalues | cut -f2 | awk '$0>75' >> metrics/greater75
	       # grthan75=$(cat metrics/greater75)
               # if [[ -n "$grthan75" ]]; then         #----( -n option - it will store null variable if output is null)
    	       #  	  	echo "The CPU is greater than 75%"
      	#		rm metrics/greater75
      #			rm metrics/allvalues
     # 			rm metrics/getmetrics
   # 		else
   #   			echo "The CPU is less than 75%"
   #   		fi
    		COUNTER=`expr $COUNTER + 1`
	done

