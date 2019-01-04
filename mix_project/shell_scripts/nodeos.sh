#!/bin/bash

rm -r /home/nirdesh.kumar/.local/share/eosio/nodeos/data


nodeos -e -p eosio  --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --contracts-console --access-control-allow-origin=*
