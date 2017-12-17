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

  function SomeContract() public payable{

  }

  event TheOemAddedAnItem(address oemaddress,bytes32 itemname,uint quantityofitem);
  event TheManufacturerRequestedForParts(bytes32 nameofpart,uint numberofparts);
  event TheManufacturerRequestedForMoreParts(bytes32 nameofthepart,uint numberoftheparts);
  event TheOemGotPaid(address _oemsaddress,uint moneyinthepoolforoem);
  event TheManufacturerRefundedTheDefectiveItem(bytes32 defectiveitem,uint numberofdefective);

  struct auto_industry {

    uint typ;
    address add;

  }

  // add oem to the network
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
  // add automobile manufacturer
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
  mapping (bytes32 => uint) price_mapping;

  //takes input of part name,no of part,part id (for adding the part to list)
  function addparts(bytes32 name, uint quantity, uint ids,uint price) only_OEM {

    uint p=parts_mapping[name];
    parts_mapping[name]=p+quantity;
    uint time_now=now;
    id_mapping[name] = ids;
    time_mapping[name]=time_now;
    price_mapping[name]=price;
    hashing_item[name]=sha3(name,ids,time_now);
    TheOemAddedAnItem(msg.sender,name,quantity);

  }

  //displays the no of quantity remaining for a particular part
  function display(bytes32 part_name) constant returns(uint) {

    return parts_mapping[part_name];

  }

  //not useful just for testing
  function display_time(bytes32 part_name) constant returns(uint) {

    return time_mapping[part_name];

  }

  //takes name and id of the part and tells weather it is genuine or not if returns 1 it is genuine
  modifier auth_part(bytes32 name, uint id_item) {

    uint  time_created=time_mapping[name];
    bytes32 hash_temp=sha3(name,id_item,time_created);
    bytes32 orig_hash=hashing_item[name];
    if(hash_temp==orig_hash) {
      _;
    }
    else {
      throw;
    }

  }

  uint pooltime;

  // till now it is used to remove the number of a specific item in the oems manufactured list
  function buy_part_amount_show (bytes32 name_of_part , uint how_many) constant returns(uint) {

    uint amount = how_many * price_mapping[name_of_part];
    return amount;

  }

  // checking for authenticity of parts and paying temporarily to the pool
  function use_OEM_Parts(bytes32 name_of_part, uint how_many, uint id_of_item) auth_part(name_of_part , id_of_item) payable {

    if( parts_mapping[name_of_part] < how_many ){
      TheManufacturerRequestedForMoreParts(name_of_part,how_many);
    }

    parts_mapping[name_of_part] = parts_mapping[name_of_part] - how_many;
    uint amount = msg.value;
    this.transfer(amount);
    pooltime=now;

    TheManufacturerRequestedForParts(name_of_part,how_many);


  }

  //give the amount present in the pool
  function getPoolMoney() constant returns (uint){

    return this.balance;

  }

  //for giving back defective items,after this manufacturer gets his money and oem takes the defective part
  function defective(bytes32 _name_of_part, uint no_of_pieces) only_AUTO_MANU {

    uint __amount = no_of_pieces * price_mapping[_name_of_part];
    msg.sender.transfer(__amount);
    TheManufacturerRefundedTheDefectiveItem(_name_of_part,no_of_pieces);

  }

  //by this function oem can take out money out of the pool to his account after 10 hrs
  function pay_to_OEM() payable only_OEM() {

    if(now-pooltime > 36000){
      TheOemGotPaid(msg.sender, this.balance);
      msg.sender.transfer(this.balance);
    }

  }

  function () payable{

  }

}
