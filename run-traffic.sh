#!/bin/bash
# copy paste this into the terminal once the setup is done
bash;
URL1="http://EC2Co-EcsEl-M1RRTZI6Q6XK-1396285135.ca-central-1.elb.amazonaws.com:8080/small";
URL2="http://EC2Co-EcsEl-M1RRTZI6Q6XK-1396285135.ca-central-1.elb.amazonaws.com:8080/medium";
URL3="http://EC2Co-EcsEl-M1RRTZI6Q6XK-1396285135.ca-central-1.elb.amazonaws.com:8080/small";

for id in 1 2 3 
do
    eval "eval target_location=\$\{URL${id}\}";
    if [[ '' != ${target_location} ]]; then
        watch -n 15 -d "wget -O /tmp/file${id} -o /dev/null --no-check-certificate -p \"${target_location//' '/'%20'}\""& #background process
    fi
done
