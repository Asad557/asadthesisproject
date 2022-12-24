#!/bin/bash
cpu=$(tail -1 /home/ubuntu/asadthesisproject/jupyter/output/cpu_pred_output | sed 's/[][]//g' | awk '{printf "%.0f\n", $1}')
echo $cpu >> /home/ubuntu/asadthesisproject/jupyter/output/cpu_pred
cpupredgrthan75=$(cat /home/ubuntu/asadthesisproject/jupyter/output/cpu_pred)
      if [[ -n "$cpupredgrthan75" ]]; then
            python3 cpupredscaling.py greater nodockername
            rm /home/ubuntu/asadthesisproject/jupyter/output/cpu_pred
      else
            docker_name=$(docker ps --format "{{.Names}}" | grep -i asad-figlet-cpupred)
            if [[ -n "$docker_name" ]]; then
                python3 cpupredscaling.py lesser $docker_name
            else
                python3 cpupredscaling.py lesser nodockername
            fi
      fi
