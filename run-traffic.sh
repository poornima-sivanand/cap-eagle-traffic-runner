#!/bin/bash

for id in 1 2 3 4 5 6 7 8 9 10
do
    target_location=URL${id};
    if [[ ${!target_location} != '' ]]; then
        watch -d "curl -vsSL ${target_location//' '/'%20'} -o /dev/null 2>&1 | grep -E '^(<|>)'" & #background process;
    fi
done
