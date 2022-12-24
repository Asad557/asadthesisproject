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


con_cpu = (sys.argv[1])
con_cpustr = [str(con_cpu)]
docker_name = (sys.argv[2])
docker_namestr = [str(docker_name)]
os.system("docker stop asad-figlet-cpupred >> /dev/null")
os.system("docker rm asad-figlet-cpupred >> /dev/null")
for cpu in con_cpustr:
    for name in docker_namestr:
      if cpu == "greater" and name == "nodockername":
            print(bcolors.WARNING + "-----------------------------------------DYNAMIC PREDICTIVE CPU SCALING------------------------------------" + bcolors.ENDC)
            os.system("docker run -d --name asad-figlet-cpupred functions/figlet >> /dev/null")
            os.system("docker start asad-figlet-cpupred >> /dev/null")
            print (" ")
            print(bcolors.WARNING + "CPU Dynamic Scaling Out" + bcolors.ENDC)
      elif cpu == "lesser" and  name == "asad-figlet-cpu":
            os.system("docker stop asad-figlet-cpupred >> /dev/null")
            os.system("docker rm asad-figlet-cpupred >> /dev/null")
            #print (" ")
            print(bcolors.WARNING + "CPU Dynamic Scaling In" + bcolors.ENDC )

      elif cpu == "lesser" and name == "nodockername":
            print("The CPU percentage is less than threshold, No Additional Container is Present")
