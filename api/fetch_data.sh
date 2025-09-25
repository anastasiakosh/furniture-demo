#!/usr/bin/env bash

OUTPUT_FILE="test_results.json"
echo "Fetching data from API..."

echo "# PostgreSQL (http://localhost:3000/pg/products)" > $OUTPUT_FILE
curl -s http://localhost:3000/pg/products >> $OUTPUT_FILE
echo -e "\n\n# MongoDB (http://localhost:3000/mongo/products)" >> $OUTPUT_FILE
curl -s http://localhost:3000/mongo/products >> $OUTPUT_FILE
echo -e "\n\n# Elasticsearch (http://localhost:3000/es/products?q=диван)" >> $OUTPUT_FILE
curl -s "http://localhost:3000/es/products?q=диван" >> $OUTPUT_FILE

echo "Data saved to $OUTPUT_FILE"
