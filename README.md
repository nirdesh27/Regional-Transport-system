# regionalTransport-system
This project is build on EOS blockchain to enhance the transport system.

first clone this repo
Project requirements:
EOS version v1.2.3

we already deployed the contract on jungle test net 
all information about wallet and account is in "configure_jungle.sh" file
you don't need to make any account or wallet 
we also created the wallet and account on jungle test net 

To set the contract in your system You just need to provide the path of your wallet directory (you just provide the path)
you also need to provide the path where you save my contract (all this info is provided in ./shell_scripts/configure_jungle.sh  )

After doing that you need to run 'test_jungle.sh' file that will interact with my contract
Note: please change vehicleid is assertion occur because you can't push same vehicleid multiple times(these conditions are handled in contract)

Modify: test_jungel.sh
change users
change vehicleId 
for different inputs

https://drive.google.com/open?id=1rO0ye4xA60bBhJ-t-fz0MpNCBMAfilIKbMJeOfeMMhU
