#!/bin/bash
# copy paste this into the terminal once the setup is done

bash;
for id in 1 2 3 
do
    eval "eval target_location=\$\{URL${id}\}";
    if [[ '' != ${target_location} ]]; then
        watch -n 15 -d "wget -O /tmp/file${id} --no-check-certificate -p \"${target_location}\"" #background process
        cat /runner/test${id}.log
    fi
done
