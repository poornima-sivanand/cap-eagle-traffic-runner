#!/bin/bash

BASE_URL='https://eagle-test.pathfinder.gov.bc.ca'
PROJECT_PREFIX='p/58851197aaecd9001b8227cc/project-details;currentPage=1;pageSize=10;sortBy=-dateAdded;ms='
PROJECTS=(1580750409346 1580750409346 1580750585604 1580750713545)

DOCUMENT_PREFIX='api/document'
DOCUMENTS=('5e2681f0b446d8001a840681/fetch/TEST DOC.pdf' '5e268292b446d8001a8406ac/fetch/TEST DOC.pdf' '58923144b637cc02bea16314/fetch/Air Liquide Liquid Nitrogen Plant - Project Compliance Letter - 2015 January 05.pdf' '5df12573f7f30e0021e7884a/fetch/NVA S6 Report_Final.pdf')

for project in "${PROJECTS[@]}"
do
    new_url=${BASE_URL}/${PROJECT_PREFIX}${project}
    curl -vsSL ${new_url}
done

for document in "${DOCUMENTS[@]}"
do
    draft_url=${BASE_URL}/${DOCUMENT_PREFIX}/${document}
    curl -LO ${draft_url//' '/'%20'}
done
