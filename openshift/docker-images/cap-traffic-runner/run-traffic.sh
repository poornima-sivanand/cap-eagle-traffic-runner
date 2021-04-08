#!/bin/bash
# copy paste this into the terminal once the setup is done
bash;


for id in 1 2 3 
do
    eval "eval target_location=\$\{URL${id}\}";
    if [[ '' != ${target_location} ]]; then
        echo ${target_location}
       #watch -n 15 -d 
       wget -O /tmp/file${id} -o /dev/null --no-check-certificate -p \"${target_location}\" >> /runner/logs.txt #background process
    fi
done
