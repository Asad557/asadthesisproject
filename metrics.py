import docker
import os
import sys

client = docker.from_env()
#client.containers.run('functions/figlet', 'name=asad-figlet')
with open('/home/ubuntu/asadthesisproject/sample.txt','r') as file:
    sampleStr = file.read()

#sample = os.system("cat sample.txt")

i = 1
while i <= 100:
    os.system("docker exec asad-figlet figlet %s"%sampleStr)
    #os.system("docker ps | tail -n +2 > dockerps.txt")
    #os.system("container_id = cat dockerps.txt |  tr -s ' ' | cut -d' ' -f1")
    #cpu_used = os.system("docker stats --no-stream | grep 06b0ec5a17db | tr -s ' ' | cut -d' ' -f3")
    #print (cpu_used)
    print ("Count =", i)
    i += 1


