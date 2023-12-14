#!/bin/sh
# Check if at least 2 arg are provided - the query and project
if [ $# -lt 2 ]; then
    echo "Usage $0 <query> [<additional args>...]"
    exit 1
fi
 
# Assign first arg as query
query="$1"
project_id="$2"
 
#Shift to nex set of args
shift
 
# Loop through args and replace placeholders in query
index=1
while [ $# -gt 0 ]; do
    query="${query//\<<$index\>>/$1}"
    shift
    ((index++))
done
 
#Execute Query
echo "$query"
 
bq query --project_id "$project_id" --format=csv --nouse_legacy_sql "$query"
 
if [ $? -ne 0 ]
then
    echo "[`date`] Error while running."
    exit 1
else
    echo "[`date`] Script ran successfully."
    exit 0
 
fi
