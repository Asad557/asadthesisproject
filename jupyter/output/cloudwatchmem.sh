#!/bin/bash
mem=$(tail -1 /root/kalyan-thesis/jupyter/output/mem_pred_output | sed 's/[][]//g' | awk '{printf "%.0f\n", $1}')
aws cloudwatch put-metric-data --metric-name Memory_Prediction --namespace arima_prediction --unit Percent --value $mem --dimensions InstanceId=i-0557908d032b9cc85,InstanceType=t2.medium --region eu-west-1
