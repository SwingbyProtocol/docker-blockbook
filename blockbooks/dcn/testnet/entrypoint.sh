#!/bin/bash

cd /opt/coins/blockbook/dcn_testnet/

./bin/blockbook -sync \
    -blockchaincfg=/app/blockchaincfg.json \
    -internal=:9030 \
    -public=:9130 \
    -resyncindexperiod=5000 \
    -resyncmempoolperiod=5000 \
    -blockheight=587922 \
    -workers=1 \
    -logtostderr
