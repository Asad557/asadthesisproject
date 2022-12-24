#!/bin/bash
cpu=$(tail -1 /root/kalyan-thesis/jupyter/output/cpu_pred_output | sed 's/[][]//g' | awk '{printf "%.0f\n", $1}')
aws cloudwatch put-metric-data --metric-name CPU_Prediction --namespace arima_prediction --unit Percent --value $cpu --dimensions InstanceId=i-0557908d032b9cc85,InstanceType=t2.medium --region eu-west-1
