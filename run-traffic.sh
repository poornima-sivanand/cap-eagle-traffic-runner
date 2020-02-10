#!/bin/bash
bash;
for id in 1 2 3 4 5 6 7 8 9 10
do
    target_location=URL${id};
    if [[ ${!target_location} != '' ]]; then
        watch -n 15 -d "wget -O /tmp/file${id} -o /dev/null --no-check-certificate -p ${target_location//' '/'%20'}" & #background process
    fi
done
