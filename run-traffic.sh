#!/bin/bash

BASE_URL='https://eagle-test.pathfinder.gov.bc.ca'

PROJECT1='p/58851197aaecd9001b8227cc/project-details;currentPage=1;pageSize=10;sortBy=-dateAdded;ms=1580750409346'
PROJECT2='api/document/5e2681f0b446d8001a840681/fetch/TEST DOC.pdf'
PROJECT3='p/58851197aaecd9001b8227cc/project-details;currentPage=1;pageSize=10;sortBy=-dateAdded;ms=1580750409346'
PROJECT4='api/document/5e268292b446d8001a8406ac/fetch/TEST DOC.pdf'
PROJECT5='p/588511bdaaecd9001b824e50/project-details;currentPage=1;pageSize=10;sortBy=-dateAdded;ms=1580750585604'
PROJECT6='api/document/58923144b637cc02bea16314/fetch/Air Liquide Liquid Nitrogen Plant - Project Compliance Letter - 2015 January 05.pdf'
PROJECT7='p/5df12431f7f30e0021e78682/documents;currentPage=1;pageSize=10;sortBy=-datePosted;ms=1580750713545'
PROJECT8='api/document/5df12573f7f30e0021e7884a/fetch/NVA S6 Report_Final.pdf'
PROJECT9=''
PROJECT10=''

for id in 1 2 3 4 5 6 7 8 9 10
do
    ProjVar=PROJECT${id}

    if [[ ${!ProjVar} != '' ]]; then
        url=${BASE_URL}/${!ProjVar}
        watch -d "curl -vsSL ${new_url//' '/'%20'} -o /dev/null 2>&1 | grep -E '^(<|>)'" & #background process
    fi
done
