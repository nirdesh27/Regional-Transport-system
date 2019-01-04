#!/bin/bash

WALLET_PATH=''
is_wallet_path=false
CONTRACT_PATH=''
is_contract_path=false

print_usage() {
    printf "Description: \n\n"
    printf "\t\n"
    printf "Usage: \n"
    printf "\t%s\t\t%s\n\n" "-w" "flag to provide wallet path. ex: './configure_jungle.sh -w /path/to/wallet'"
    printf "\t%s\t\t%s\n\n" "-c" "flag to provide contract path. ex: './configure_jungle.sh -c /path/to/contract'"
    printf "\t%s\t\t%s\n\n" "-h" "flag to see the usage. ex: ' ./configure_jungle.sh -h"
    printf "Full example: \n\n"
    printf "\t'./configure_jungle.sh -w /path/to/wallet -c /path/to/contract'\n\n"
}


while getopts 'hw:c:' flag; do
 case "${flag}" in
   w) is_wallet_path=true
      WALLET_PATH="${OPTARG}";;
   c) is_contract_path=true
      CONTRACT_PATH="${OPTARG}";;
   h) print_usage
      exit 1;;
 esac
done

if [ $is_wallet_path = false ]
then
printf '[::] Please provide wallet path ...\n\n'
exit 1;
fi;

if [ $is_contract_path = false ]
then
printf '[::] Please provide your contract path.\n\n'
exit 1;
fi;

printf "[::] Setting up wallet and contract paths.\n\n"
sleep 2

# set these variables as per your environment
CWD=$(pwd) 

rm wallet_details.txt

cd $WALLET_PATH

rm admin.wallet

cd $CWD
touch wallet_details.txt

private_key_eos="5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"
pub_key_eos="EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"

private_key_5="5HzoHr9peU7kzQ12dNCsnaGozNBMzVSMfc3V8UcSxP4S6TgMju4"
public_key_5="EOS6yxAjdjGXe2ZniJx7XkqkLJwdCnjuCEZPjKKPYbRnU1wwB3dTv"

private_key_6="5JAyaRhpGq6gsDkMpZQSE38qctNDhTDJoumjDYjnCNnK88TnZWE"
public_key_6="EOS7Y2kEbJBEJaDisKXvG29VzShgSsXKCjQeuGn9isFSZJp5iGjb1"

printf "[::] Creating wallet viz. admin...\n\n"
sleep 2
cleos --wallet-url http://127.0.0.1:8900 wallet create -n admin  --to-console>>wallet_details.txt

printf "[::] Importing private keys into the wallet admin...\n\n"
sleep 2
echo $private_key_5|cleos --wallet-url http://127.0.0.1:8900 wallet import -n admin
echo $private_key_6|cleos --wallet-url http://127.0.0.1:8900 wallet import -n admin
echo $private_key_eos|cleos --wallet-url http://127.0.0.1:8900 wallet import -n admin

# echo "[::] Compiling the contract viz. transport.cpp..."
# cd $CONTRACT_PATH
# eosiocpp -o mixproject.wast mixproject.cpp
# eosiocpp -g mixproject.abi mixproject.cpp

printf "\n[::] Pushing the contract on jungle testnet...\n\n"
cleos --url https://jungle2.cryptolions.io:443 set contract transysadmin $CONTRACT_PATH

printf "[::] Finished.\n\n"
