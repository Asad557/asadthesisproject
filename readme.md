# Thesis project steps

1. Run figlet docker container using command `docker run --name=asad-figlet functions/figlet`
2. Execute `metrics.py` file 
3. Open different terminal sessions of an ec2 server and execute `docker stats asad-figlet` command.
4. Prometheus Query for getting cpu-usage in percentage for a specific container ````promQL
rate(container_cpu_user_seconds_total{name="asad-figlet"}[30s]) * 100 ```
`
