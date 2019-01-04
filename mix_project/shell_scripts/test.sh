#!/bin/bash

echo "Hello"
sleep 5
echo "Hello2"

# cleos push action nirdesh feeddetails '{"ownerssn":"123456","license":"lic123","ownername":"akash","vehicle_id":"BR11E0000","numberoftyres": 4,"preowner":"123456","producer":"Hero Honda","regdate":"12-12-2012"}' -p nirdesh


# cleos push action nirdesh sellvehicle '{"ownerssn":"123456","vehicle_id":"BR11E0000","newssn":"123457","newlicense":"lic124","newname":"nirdesh"}' -p nirdesh

# cleos push action nirdesh addmore '{"ownerssn":"123456","ownername":"akash","vehicle_id":"up114535","numberoftyres":2,"preowner":"123456","producer":"Honda","regdate":"12-12-1913"}' -p nirdesh

# cleos get table nirdesh nirdesh ttab

# cleos get table nirdesh nirdesh vehicle