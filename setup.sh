#!/bin/sh

echo "Extracting Solr"

tar -xf solr-5.0.0.tgz

cd solr-5.0.0
echo "Starting Solr"
bin/solr start -cloud
echo "Creating Collections"

bin/solr create_collection -c kyoto_sample
bin/solr create_collection -c kyoto_py
# Comment/Uncomment if you want to run the full
bin/solr create_collection -c kyoto_full