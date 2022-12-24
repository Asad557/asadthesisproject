#!/bin/bash
mem=$(tail -1 /home/ubuntu/asadthesisproject/jupyter/output/jupyter/output/mem_pred_output | sed 's/[][]//g' | awk '{printf "%.0f\n", $1}')
echo $mem >> /home/ubuntu/asadthesisproject/jupyter/output/jupyter/output/mem_pred
mempredgrthan65=$(cat /home/ubuntu/asadthesisproject/jupyter/output/jupyter/output/mem_pred)
      if [[ -n "$mempredgrthan65" ]]; then
            python3 mempredscaling.py greater nodockername
            rm /home/ubuntu/asadthesisproject/jupyter/output/jupyter/output/mem_pred
      else
            docker_name=$(docker ps --format "{{.Names}}" | grep -i asad-figlet-mempred)
            if [[ -n "$docker_name" ]]; then
                python3 mempredscaling.py lesser $docker_name
            else
                python3 mempredscaling.py lesser nodockername
	    fi
      fi
