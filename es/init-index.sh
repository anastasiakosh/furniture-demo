#!/usr/bin/env bash
ES_URL=http://localhost:9200
INDEX=furniture

echo "Waiting for Elasticsearch at $ES_URL ..."

until curl -sSf "$ES_URL" > /dev/null; do
sleep 1
done

echo "Creating index $INDEX with mapping..."
curl -s -X PUT "$ES_URL/$INDEX" -H 'Content-Type: application/json' -d'
{
"mappings": {
"properties": {
"name": { "type": "text" },
"category": { "type": "keyword" },
"price": { "type": "double" },
"material": { "type": "keyword" },
"color": { "type": "keyword" },
"attributes": { "type": "object" }
}
}
}
'

echo "Bulk indexing sample documents..."
curl -s -X POST "$ES_URL/$INDEX/_bulk?pretty" -H 'Content-Type: application/x-ndjson' --data-binary "@bulk.json"

echo "Done. Example search: curl '$ES_URL/$INDEX/_search?q=диван'"
