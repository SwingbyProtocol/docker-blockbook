#!/bin/bash

dir=$DIR
if ! type "unzip" >/dev/null; then
    apt-get update
    apt-get install -y wget curl
fi

if [ -e "$dir/testnet/bsc_testnet/genesis.json" ]; then
    exit 0
fi
mkdir -p "$dir/testnet/bsc_testnet"
cd "$dir/testnet/bsc_testnet"
wget --no-check-certificate $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest | grep browser_ | grep testnet | cut -d\" -f4)
unzip testnet.zip
rm *.zip