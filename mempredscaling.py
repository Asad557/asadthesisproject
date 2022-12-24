from __future__ import division
import os
import sys

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


con_mem = (sys.argv[1])
con_memstr = [str(con_mem)]
docker_name = (sys.argv[2])
docker_namestr = [str(docker_name)]
os.system("docker stop asad-figlet-mempred >> /dev/null")
os.system("docker rm asad-figlet-mempred >> /dev/null")
for mem in con_memstr:
    for name in docker_namestr:
        if mem == "greater" and name == "nodockername":
            print(bcolors.OKGREEN + "-----------------------------------------DYNAMIC PREDECTIVE  MEMORY SCALING------------------------------------" + bcolors.ENDC)
            os.system("docker run -d --name asad-figlet-mempred functions/figlet >> /dev/null")
            os.system("docker start asad-figlet-mempred >> /dev/null")
            print(bcolors.OKGREEN + "MEMORY Dynamic Scaling Out" + bcolors.ENDC)
        elif mem == "lesser" and  name == "asad-figlet-mem":
            os.system("docker stop asad-figlet-mempred >> /dev/null")
            os.system("docker rm asad-figlet-mempred >> /dev/null")
            #print (" ")
            print(bcolors.OKGREEN + "MEMORY Dynamic Scaling In" +bcolors.ENDC)
        elif mem == "lesser" and name == "nodockername":
            print("The Memory Percentage is less than threshold, No additional container is present")

