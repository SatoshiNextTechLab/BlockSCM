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

  uint[] public parts_quantity;

  mapping (bytes32 => uint number) parts_mapping;

  function addparts(bytes32 name, uint quantity) only_OEM {

    parts_mapping[name]=quantity;

  }

  function display(bytes32 part_name) constant returns(uint[]) {

    return parts_mapping[part_name].number;

  }

}
