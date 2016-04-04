#!/bin/bash

path=$PWD

if [ $# -ne 3 ]
  then
    echo "Usage: ${0} \"ES host\"  \"indexname\" \"new index version number\""
    echo
    echo "Example: ${0} 172.16.46.240 analytics-2016.01.31 3"
    exit 1
fi
host=$1
indexname=$2
version="v$3"
newindex="${indexname}-${version}"
export PATH=$PATH:.
curl -XPOST ${host}:9200/${newindex} 
#the mappings you want in the new index
curl -XPUT  "http://${host}:9200/${newindex}/_mapping/analytics" --data @${path}/mappings.json
es-reindex.rb http://${host}:9200/${indexname} http://${host}:9200/${newindex}
#here we DELETE the original index, I'm putting some es-reindex ^^ failure detection, so we don't remove valuable data
curl -XDELETE ${host}:9200/${indexname} 
#create the aliad to the old index
curl -XPOST ${host}:9200/_aliases -d "
{
    \"actions\": [
        { \"add\": {
            \"alias\": \"${indexname}\",
            \"index\": \"${newindex}\"
        }}
    ]
}
"
