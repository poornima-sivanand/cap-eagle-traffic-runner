#!/bin/bash
# copy paste this into the terminal once the setup is dones
for id in 1 2 3 
do
    eval "eval target_location=\$\{URL${id}\}";
    if [[ '' != ${target_location} ]]; then
        watch -n 15 -d "wget -O /tmp/file${id} -o /runner/test${id}.log --no-check-certificate -p \"${target_location}\""& #background process
    fi
done
