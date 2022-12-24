#!/bin/bash
#SCRIPT_PATH1="/home/ubuntu/asadthesisproject/jupyter/output/cpu_pred.sh"
#SCRIPT_PATH2="/home/ubuntu/asadthesisproject/jupyter/output/mem_pred.sh"
getmetrics=200
COUNTER=1
  while [  $COUNTER -lt $getmetrics ]; do
    echo The getmerics count is $COUNTER 
    docker stats --no-stream | grep asad-figlet | tr -s ' ' | cut -d' ' -f3 | sed 's/%//' >> metrics/cpumetrics
    docker stats --no-stream | grep asad-figlet | tr -s ' ' | cut -d' ' -f7 | sed 's/%//' >> metrics/memmetrics
    #cat metrics/getmetrics |  cut -d' ' -f3 | sed 's/%//' >> metrics/allvalues
    removedecimalcpu=$(sed '1d' metrics/cpumetrics | cut -f2 | awk '$0>75') 
    echo ${removedecimalcpu%%.*} >> metrics/cpugreater75
    removedecimalmem=$(sed '1d' metrics/memmetrics | cut -f2 | awk '$0>65') 
    echo ${removedecimalmem%%.*} >> metrics/memgreater65
     
   
    cpugrthan75=$(cat metrics/cpugreater75)
    if [[ -n "$cpugrthan75" ]]; then         #----( -n option - it will store null variable if output is null)
      echo "The CPU is greater than 75%"
      #--------------------------createcpucsv.sh-------------------------------------------------
      date=$(date "+%d/%m/%Y")
      latestcpu=$(tail -1 metrics/cpugreater75)
      FILE=./jupyter/csv/cpu.csv
      if test -f "$FILE"; then
        echo $date,$latestcpu >> ./jupyter/csv/cpu.csv

      else
	echo "Date,Cpu_Resource" >> ./jupyter/csv/cpu.csv
	echo $date,$latestcpu >> ./jupyter/csv/cpu.csv
      fi
      
      #----------------------------------------------------------------------------------------
      rm metrics/cpumetrics
      rm metrics/cpugreater75
      python3 cpuscaling.py greater nodockername
     #SCRIPT_PATH1="/home/ubuntu/asadthesisproject/jupyter/output/cpu_pred.sh"
      bash ./cpu_pred.sh
     else
      echo "The CPU is less than 75%"
      docker_name=$(docker ps --format "{{.Names}}" | grep -i asad-figlet-cpu)
        if [[ -n "$docker_name" ]]; then
	        #echo "with docker name"
	        #rm metrics/cpumetrics
                #rm metrics/cpugreater75	
		python3 cpuscaling.py lesser $docker_name
	else 
		#rm metrics/cpumetrics
                #rm metrics/cpugreater75
		#echo "without docker name"
		python3 cpuscaling.py lesser nodockername
	fi
      fi    

   memgrthan65=$(cat metrics/memgreater65)
    if [[ -n "$memgrthan65" ]]; then         #----( -n option - it will store null variable if output is null)
      echo "The Memory is greater than 65%"
      #--------------------------createcpucsv.sh-------------------------------------------------
      date=$(date "+%d/%m/%Y")
      latestmem=$(tail -1 metrics/memgreater65)
      FILE=./jupyter/csv/mem.csv
      if test -f "$FILE"; then
        echo $date,$latestmem >> ./jupyter/csv/mem.csv

      else
        echo "Date,Mem_Resource" >> ./jupyter/csv/mem.csv
        echo $date,$latestmem >> ./jupyter/csv/mem.csv
      fi

      #----------------------------------------------------------------------------------------
      rm metrics/memmetrics
      rm metrics/memgreater65
      python3 memscaling.py greater nodockername
      bash "$CRIPT_PATH2"
    else
      echo "The Memory is less than 65%"
      #rm metrics/memmetrics
      #rm metrics/memgreater65
      docker_name=$(docker ps --format "{{.Names}}" | grep -i asad-figlet-mem)
        if [[ -n "$docker_name" ]]; then
                #echo "with docker name"
                python3 memscaling.py lesser $docker_name
        else
                #echo "without docker name"
                python3 memscaling.py lesser nodockername
        fi
      fi
  COUNTER=`expr $COUNTER + 1`
done
