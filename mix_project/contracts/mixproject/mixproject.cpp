/*
author: Nirdesh Kumar Choudhary 
this contract works on the concept of : 
*/

#include "mixproject.hpp"
#include <eosiolib/transaction.hpp>
#include <eosiolib/print.hpp>
#include <vector>
#include "/home/nirdesh.kumar/eosio.token/eosio.token.hpp"
#include <eosiolib/symbol.hpp>
#include <eosiolib/eosio.hpp>
#include <iostream>
#include <string>
#include <stdlib.h>

namespace Mixproject
{

//@abi table vehicle i64
struct vehicle
{
    string vehicle_id;
    uint64_t ownerssn;
    uint64_t numberoftyres;
    vector<uint64_t> preowners;
    string producer;
    string regdate;
    uint64_t primary_key() const { return eosio::string_to_name(vehicle_id.c_str()); }

    EOSLIB_SERIALIZE(vehicle, (vehicle_id)(ownerssn)(numberoftyres)(preowners)(producer)(regdate))
};

typedef multi_index<N(vehicle), vehicle> __vehicle;

// @abi table ttab i64
struct ttab
{
    uint64_t ownerssn;
    uint64_t vehiclecount;
    string license;
    vector<string> vehicle_id;
    string ownername;

    uint64_t primary_key() const { return ownerssn; }

    EOSLIB_SERIALIZE(ttab, (ownerssn)(vehiclecount)(license)(vehicle_id)(ownername))
};

typedef multi_index<N(ttab), ttab> _ttab;

// @abi action
void MixprojectContract::getdetail(string vehiclenumber)
{
    //vehiclenumber should be withour space
}

// @abi action
void MixprojectContract::feeddetails(uint64_t ownerssn, string license, string ownername, string vehicle_id, uint64_t numberoftyres, uint64_t preowner, string producer, string regdate)
{
    require_auth(_self);
    _ttab ttabs(_self, _self);

    auto iter = ttabs.find(ownerssn);
    if (iter == ttabs.end())
    {

        print("need has been  inserted\t");
        ttabs.emplace(_self, [&](auto &ttab) {
            ttab.ownerssn = ownerssn;
            ttab.vehiclecount += 1;
            ttab.license = license;
            ttab.vehicle_id.push_back(vehicle_id);
            ttab.vehicle_id.push_back("1");
            ttab.ownername = ownername;
        });
    }
    else
    {
        print("data already exist\t");
    }
    ////////////////////////////////////////second table /////////////////////////////////////
    __vehicle tvehicle(_self, _self);
    auto iter1 = tvehicle.find(eosio::string_to_name(vehicle_id.c_str()));
    if (iter1 == tvehicle.end())
    {
        print("need insert\t");
        tvehicle.emplace(_self, [&](auto &vehicle) {
            vehicle.vehicle_id = vehicle_id;
            vehicle.ownerssn = ownerssn;
            vehicle.numberoftyres = numberoftyres;
            vehicle.preowners.push_back(preowner);
            vehicle.producer = producer;
            vehicle.regdate = regdate;
        });
    }
    else
    {
        print("exit already");
    }
}

// @abi action
void MixprojectContract::addmore(uint64_t ownerssn, string ownername, string vehicle_id, uint64_t numberoftyres, uint64_t preowner, string producer, string regdate)
{
    //update main table
    _ttab etabs(_self, _self);
    auto iter = etabs.find(ownerssn);
    if (iter != etabs.end())
    {
        etabs.modify(iter, _self, [&](auto &a) {
            a.vehiclecount += 1;
            a.vehicle_id.push_back(vehicle_id);
            a.vehicle_id.push_back("1");
            // a.preowners.append(newaccount);
        });
    }
    //insert into the vehicle table
    __vehicle addnewitem(_self, _self);
    auto iter1 = addnewitem.find(eosio::string_to_name(vehicle_id.c_str()));
    if (iter1 == addnewitem.end())
    {
        print("need insert\t");
        addnewitem.emplace(_self, [&](auto &vehicle) {
            vehicle.vehicle_id = vehicle_id;
            vehicle.ownerssn = ownerssn;
            vehicle.numberoftyres = numberoftyres;
            vehicle.preowners.push_back(preowner);
            vehicle.producer = producer;
            vehicle.regdate = regdate;
        });
    }
    else
    {
        print("exit already");
    }
}
// @abi action
void MixprojectContract::sellvehicle(uint64_t ownerssn, string vehicle_id, uint64_t newssn, string newlicense, string newname)
{
    //update sellers table
    _ttab etabs(_self, _self);
    auto iter = etabs.find(ownerssn);
    eosio_assert(ownerssn != newssn, "can  not sell to yourself");
    // vector<string> temp = iter->vehicle_id;
    // print("length of vector is : ", temp.size());
    if (iter != etabs.end())
    {
        etabs.modify(iter, _self, [&](auto &a) {
            a.vehiclecount -= 1;
            a.vehicle_id.push_back(vehicle_id);
            a.vehicle_id.push_back("0");
            // a.preowners.append(newaccount);
        });
    }

    //update the vehicle table for new user
    __vehicle vehicle(_self, _self);
    auto iter1 = vehicle.find(eosio::string_to_name(vehicle_id.c_str()));

    eosio_assert(iter1->ownerssn == ownerssn, "you don't own this vehicle");
    eosio_assert(iter1->ownerssn != newssn, "vehicle is alreays owner by this user");

    if (iter1 != vehicle.end())
    {
        vehicle.modify(iter1, _self, [&](auto &a) {
            a.ownerssn = newssn;
            a.preowners.push_back(ownerssn);
            // a.preowners.append(newaccount);
        });
    }

    //adding ttabs for new account
    _ttab ttabs1(_self, _self);

    auto iter2 = ttabs1.find(newssn);
    if (iter2 == ttabs1.end())
    {
        // if he does't add any vehicle yet
        print("need insert\t");
        ttabs1.emplace(_self, [&](auto &ttab) {
            ttab.ownerssn = newssn;
            ttab.vehiclecount += 1;
            ttab.license = newlicense;
            // vector<string> custom_array = ttab.vehicle_id;
            // custom_array.push_back(vehicle_id);
            ttab.vehicle_id.push_back(vehicle_id);
            ttab.vehicle_id.push_back("1");
            ttab.ownername = newname;
        });
    }
    else
    {
        // update the new user table
        _ttab updatenew(_self, _self);
        auto iter3 = updatenew.find(newssn);
        if (iter3 != updatenew.end())
        {
            updatenew.modify(iter3, _self, [&](auto &a) {
                a.vehiclecount += 1;
                a.vehicle_id.push_back(vehicle_id);
                a.vehicle_id.push_back("1");
                // a.preowners.append(newaccount);
            });
        }
    }
}

} // namespace Mixproject