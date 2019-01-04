/*
author: Nirdesh Kumar Choudhary
this is main .hpp file of our contract provide the following:

*/
#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>
// #include <eosio/chain/asset.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/crypto.h>
#include <eosiolib/types.hpp>
#include <eosiolib/types.h>
#include <string>

namespace Mixproject
{
using namespace eosio;
using std::string;

class MixprojectContract : public contract
{

  public:
    MixprojectContract(account_name self) : contract(self) {}

    // @abi action
    void getdetail(string vehiclenumber);

    // @abi action
    void feeddetails(uint64_t ownerssn,
                     string license,
                     string ownername,
                     string vehicle_id,
                     uint64_t numberoftyres,
                     uint64_t preowner,
                     string producer,
                     string regdate);

    // @abi action
    void addmore(uint64_t ownerssn,
                 string ownername,
                 string vehicle_id,
                 uint64_t numberoftyres,
                 uint64_t preowner,
                 string producer,
                 string regdate);

    // @abi action
    void sellvehicle(uint64_t ownerssn,
                     string vehicle_id,
                     uint64_t newssn,
                     string newlicense,
                     string newname);
};

EOSIO_ABI(MixprojectContract, (getdetail)(feeddetails)(addmore)(sellvehicle))
} // namespace Mixproject
