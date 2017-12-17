//Blockchain consortium for Automobile Sector –
//Setup a private blockchain consortium with
//minimum 2 parties (Automobile manufacturer and
//OEM manufacturer). The Blockchain solution is
//enabled to track the movement of automobile spare parts from
//OEM warehouse to Automobile manufacturer facility where
//they are also recorded in the blockchain while
//each part is installed in a vehicle and the
//information of vehicle is recorded in the ledger as well.


pragma solidity ^0.4.0;

contract SomeContract {

  struct auto_industry {

    uint typ;
    address add;

  }

  mapping(address => auto_industry ) addautoindustry;

  function add_OEM() {

    addautoindustry[msg.sender]=auto_industry(1,msg.sender);

  }

  modifier only_OEM() {

    if (addautoindustry[msg.sender].typ==1){
      _;
    }

    else {
      throw;
    }

  }

  function add_AUTO_MANU() {

    addautoindustry[msg.sender]=auto_industry(2,msg.sender);

  }

  modifier only_AUTO_MANU() {

    if (addautoindustry[msg.sender].typ==2){
      _;
    }

    else {
      throw;
    }

  }


  mapping (bytes32 => uint) parts_mapping;
  mapping (bytes32 => uint) id_mapping;
  mapping (bytes32 => uint) time_mapping;
  mapping (bytes32 => bytes32) hashing_item;

  function addparts(bytes32 name, uint quantity, uint ids) only_OEM {

    uint p=parts_mapping[name];
    parts_mapping[name]=p+quantity;
    uint time_now=now;
    id_mapping[name] = ids;
    time_mapping[name]=time_now;
    hashing_item[name]=sha3(name,ids,time_now);

  }

  function display(bytes32 part_name) constant returns(uint) {

    return parts_mapping[part_name];

  }

  function display_time(bytes32 part_name) constant returns(uint) {

    return time_mapping[part_name];

  }

  function use_OEM_Parts(bytes32 name_of_part, uint how_many) returns (uint) {

    parts_mapping[name_of_part] = parts_mapping[name_of_part] - how_many;
    return parts_mapping[name_of_part];

  }
  function auth_part(bytes32 name, uint id_item) constant returns(uint) {

    uint  time_created=time_mapping[name];
    bytes32 hash_temp=sha3(name,id_item,time_created);
    bytes32 orig_hash=hashing_item[name];
    if(hash_temp==orig_hash) {
      return 1;
    }
    else {
      return 2;
    }

  }

}
