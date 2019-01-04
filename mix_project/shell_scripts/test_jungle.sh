#!/bin/bash
# echo "CHECKING balance of transysadmin"
printf "[::] getting value of table  user before any transaction from blockchain ...\n\n"
sleep 2

cleos --url https://jungle2.cryptolions.io:443 get table transysadmin transysadmin ttab
printf"\n\n"
printf "[::] getting value of table vehicle before any transaction from blockchain ...\n\n"
sleep 2
cleos --url https://jungle2.cryptolions.io:443 get table transysadmin transysadmin vehicle
printf"\n\n"
printf "[::] user1 with ssn 123456 buys a new vehicle with info \n vehicle id BR11E000 \n numberfotypers : 4, \n perowner: ssn 123456 \n producer: Hero Honda \n regdate: 01-01-2019  ...\n\n"
sleep 2

cleos --url https://jungle2.cryptolions.io:443 push action transysadmin feeddetails '{"ownerssn":"123456", "license":"lic123", "ownername":"user1", "vehicle_id":"BR11E0012",  "numberoftyres": 4, "preowner":"123456", "producer":"Hero Honda", "regdate":"01-01-2019"}' -p transysadmin

printf"\n\n"
printf"[::] user1 with same ssn buys another new vehicle with info \n vehicle id up114535 \n numberfotypers : 2, \n perowner: ssn 123456 \n producer: Honda \n regdate: 12-12-2019  ... \n\n"
sleep 2

cleos --url https://jungle2.cryptolions.io:443 push action transysadmin addmore '{"ownerssn":"123456", "ownername":"user1",  "vehicle_id":"up114567", "numberoftyres":2, "preowner":"123456", "producer":"Honda",   "regdate":"12-12-2019"}' -p transysadmin

printf"\n\n"
printf " [::] user1 sells his vehicle with vehicleID : BR11E0012 to user2 with ssn : 123457 \n and newliscense : lic124 \n\n"
sleep 2

cleos --url https://jungle2.cryptolions.io:443 push action transysadmin sellvehicle '{"ownerssn":"123456","vehicle_id":"BR11E0012","newssn":"123457","newlicense":"lic124","newname":"user2"}' -p transysadmin

printf"\n\n"
printf "[::] user Table after transactins  ..\n\n"
sleep 2

cleos --url https://jungle2.cryptolions.io:443 get table transysadmin transysadmin ttab

printf"\n\n"
printf "[::] vehicle Table after transactins  ..\n\n"
sleep 2
cleos --url https://jungle2.cryptolions.io:443 get table transysadmin transysadmin vehicle

