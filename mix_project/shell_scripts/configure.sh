#!/bin/bash
EOS_WALLET="/home/nirdesh.kumar/eosio-wallet"
EOS_HOME="/home/nirdesh.kumar/EOS/eos"

POC_CONTRACTS="/home/nirdesh.kumar/work/mix_project/contracts/mixproject"


# set these variables as per your environment
CWD=$(pwd) 


rm wallet_details.txt

cd $EOS_WALLET
rm sender.wallet    
rm receiver.wallet
rm nirdesh.wallet 
rm eosio.token.wallet
rm receiver2.wallet

cd $CWD
touch wallet_details.txt


private_key_eos="5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"
pub_key_eos="EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"


# echo $private_key_eos
# echo $pub_key_eos


private_key_1=5KP8LBLYPjmFZTngxZXYViWrEKgnDo85moe2ABUxV33YTnsWtdJ
public_key_1=EOS5UaFytwGL5awx67NpuJYxagmtCbXxVGqmfX2Q1veBijTfFxv3H

private_key_2=5Hsr7v3Jphjgps333M6SHs4YhR1BJDtmZHRkHu83NvZeVwFtJMg
public_key_2=EOS5mnkeeK2rKVY9AzMC6uBwB2BztrAJr3Huehbf9tfgSHT6QtNF5

private_key_3=5KJbuZJWYkJTKqzakkgtNBupzbrdTFfYeWYckFScHeLbqhFTxXq
public_key_3=EOS8BT1gAXH7GmgBCe1K6f9Fi21DazpukYNC71NWszHreU3uYK7Kz

private_key_4=5Jus8KsjFWMXEbZayBHzu3XmKZpFQA2YVZ5WqHPNJxUNPGFiQhE
public_key_4=EOS6Ud7ji9njSzaswsrSNbPSBq3JQKEF9pYE7gD8w7cYWJRyAc2DW

private_key_5=5KhhP1gXeadJ7y9Pduocx6FqqHr5duetz95zYYrfCmpH36wfuUT
public_key_5=EOS8XiRgzubBz4y7gERpQvaSLL2gEjgSLEE44K2CKzjfKMyFzw81B

private_key_6=5JJBGMRtxaHwE2hHk4dRnkor8hdW1Z3N6ToXR9QpZFhYZa3Ax4f
public_key_6=EOS6i9MsfoMRcJ7AvUzr777yMRpjSNFMWp5NGXSe1Avgmeq7NeWuj

private_key_7=5JEicM4tvK31CaRWeyQ5jP1tZH5JgpVGiMnKcdCWA3SgpsChFGr
public_key_7=EOS5uz22p9YUbPNJSthfybmGYDRerbtZ1sxXz93VYrapuB3NFLVmn

private_key_8=5KHBt3ujpJ1M14JnAMzLJHJe8RMR17QXRmibgougqcD9TgNoeNY
public_key_8=EOS7aDExFa7SjeezXeRP6n314Hu5WK9ChmGbm7LJpmg2qZUAf1u9J

private_key_9=5JmjT7FtbCyCWPUqtjycHfmPfekMXt6hViw42KYGJvfE55Q67UW
public_key_9=EOS8Bc6kkmK4g6HEtCH8r5geWyAg2YXfFApDjTdkDJs6CN5eyUFMu

private_key_10=5K8ochg9oTuJ8m51MkxWT7TPGb9nwvNvkaDAxhpvCUC4zf5DLav
public_key_10=EOS5uTQeBuhgspnF4t86xi5ieYGGxUVN1UekK3bcRutHSZXHjzFao

cleos --wallet-url http://127.0.0.1:8900 wallet create -n sender  --to-console>>wallet_details.txt
cleos --wallet-url http://127.0.0.1:8900 wallet create -n receiver  --to-console>>wallet_details.txt
cleos --wallet-url http://127.0.0.1:8900 wallet create -n receiver2  --to-console>>wallet_details.txt
cleos --wallet-url http://127.0.0.1:8900 wallet create -n nirdesh  --to-console>>wallet_details.txt
cleos --wallet-url http://127.0.0.1:8900 wallet create -n eosio.token  --to-console>>wallet_details.txt

echo $private_key_1|echo $private_key_1|cleos --wallet-url http://127.0.0.1:8900 wallet import -n sender
echo $private_key_2|cleos --wallet-url http://127.0.0.1:8900 wallet import  -n sender
echo $private_key_eos|cleos --wallet-url http://127.0.0.1:8900 wallet import  -n sender
echo $private_key_3|cleos --wallet-url http://127.0.0.1:8900 wallet import  -n receiver
echo $private_key_4|cleos --wallet-url http://127.0.0.1:8900 wallet import  -n receiver
echo $private_key_eos|cleos --wallet-url http://127.0.0.1:8900 wallet import  -n receiver
echo $private_key_5|cleos --wallet-url http://127.0.0.1:8900 wallet import -n nirdesh
echo $private_key_6|cleos --wallet-url http://127.0.0.1:8900 wallet import -n nirdesh
echo $private_key_eos|cleos --wallet-url http://127.0.0.1:8900 wallet import -n nirdesh
echo $private_key_7|cleos --wallet-url http://127.0.0.1:8900 wallet import -n eosio.token
echo $private_key_8|cleos --wallet-url http://127.0.0.1:8900 wallet import -n eosio.token
echo $private_key_eos|cleos --wallet-url http://127.0.0.1:8900 wallet import -n eosio.token
echo $private_key_9|cleos --wallet-url http://127.0.0.1:8900 wallet import -n receiver2
echo $private_key_10|cleos --wallet-url http://127.0.0.1:8900 wallet import -n receiver2
echo $private_key_eos|cleos --wallet-url http://127.0.0.1:8900 wallet import -n receiver2

cleos create account eosio sender $public_key_1 $public_key_2
cleos create account eosio receiver $public_key_3 $public_key_4
cleos create account eosio nirdesh $public_key_5 $public_key_6
cleos create account eosio eosio.token $public_key_7 $public_key_8
cleos create account eosio receiver2 $public_key_9 $public_key_10 




cd $EOS_HOME
# pwd


# eosiocpp -o ./contracts/eosio.token/eosio.token.wast ./contracts/eosio.token/eosio.token.cpp
# eosiocpp -g ./contracts/eosio.token/eosio.token.abi ./contracts/eosio.token/eosio.token.cpp


cleos set contract eosio.token ./contracts/eosio.token/ 

# cleos set contract eosio.token ./contracts/eosio.token/ ./contracts/eosio.token/eosio.token.wast ./contracts/eosio.token/eosio.token.abi



# cleos push action eosio.token create '{"issuer":"eosio.token","maximum_supply":"1000000.0000 EOS","can_freeze":"0","can_recall":"0","can_whitelist":"0"}' -p eosio.token

# cleos push action eosio.token issue '{"to":"eosio.token","quantity":"2000.0000 EOS","memo":"first issued"}' -p eosio.token

# cleos push action eosio.token issue '{"to":"nirdesh","quantity":"1000.0000 EOS","memo":"first issued"}' -p eosio.token

# cleos push action eosio.token transfer '{"from":"nirdesh","to":"sender","quantity":"20.0000 EOS","memo":"my first transfer"}' -p nirdesh

# cleos push action eosio.token transfer '{"from":"nirdesh","to":"receiver","quantity":"20.0000 EOS","memo":"my first transfer"}' -p nirdesh

cd $POC_CONTRACTS
eosiocpp -o mixproject.wast mixproject.cpp
eosiocpp -g mixproject.abi mixproject.cpp

cleos set contract nirdesh $POC_CONTRACTS


# #permissions for running deferred transaction for user 'sender'
cleos set account permission sender active '{"threshold": 1,"keys": [{"key": "EOS5mnkeeK2rKVY9AzMC6uBwB2BztrAJr3Huehbf9tfgSHT6QtNF5","weight": 1}],"accounts": [{"permission":{"actor":"nirdesh","permission":"eosio.code"},"weight":1}]}' owner -p sender

# cleos push action eosio.token transfer '{"from":"inno","to":"sender","quantity":"22.0000 EOS","memo":"my first transfer"}' -p inno
# cleos push action eosio.token transfer '{"from":"inno","to":"sender","quantity":"22.0000 EOS","memo":"my first transfer"}' -p inno


echo "BRAVO"
