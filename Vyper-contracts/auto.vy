#Vyper Contract
time_now: public(timestamp)
string_hash: public(bytes32)
pooltime: public(timestamp)

auto_industry: public({
  typ: uint256,
  _add: address
}[address])


vehicle: public({
  vehicle_id: uint256,
  vehicle_name: bytes32
}[uint256])

parts_mapping: public(uint256[bytes32])
id_mapping: public(uint256[bytes32])
time_mapping: public(timestamp[bytes32])
hashing_item: public(bytes32[bytes32])
price_mapping: public(uint256[bytes32])
completeness: public(uint256[uint256])

@public
@payable
def __init__():
  pass


@public
def add_OEM():
  self.auto_industry[msg.sender]= {typ: 1,_add: msg.sender}

@public
def add_AUTO_MANU():
  self.auto_industry[msg.sender]= {typ: 2,_add: msg.sender}


@public
def addparts(name: bytes32,quantity: uint256,ids: uint256,price: uint256):
  assert self.auto_industry[msg.sender].typ == 1
  self.parts_mapping[name]+=quantity
  self.time_now=block.timestamp
  self.id_mapping[name]=ids
  self.time_mapping[name]=self.time_now
  self.price_mapping[name]=price
  # figure out a way to hash name,ids and time together
  self.hashing_item[name]=sha3(name)

@public
@constant
def display(part_name: bytes32) -> uint256:
  return self.parts_mapping[part_name]

@public
@constant
def buy_part_amount_show(name_of_part: bytes32, how_many: uint256) -> uint256:
  return how_many*self.price_mapping[name_of_part]

@public
@payable
def use_OEM_Parts(name_of_part: bytes32,how_many: uint256,id_of_item: bytes32):
  #include hash check here
  assert self.parts_mapping[name_of_part] > how_many
  self.parts_mapping[name_of_part]-=how_many
  self.pooltime = block.timestamp


@public
@constant
def getPoolMoney() -> uint256(wei):
  return self.balance

@public
def defective(_name_of_part: bytes32, no_of_pieces: uint256(wei)):
  assert self.auto_industry[msg.sender].typ == 2
  send(msg.sender,no_of_pieces*self.price_mapping[_name_of_part])


@public
@payable
def pay_to_OEM():
  assert self.auto_industry[msg.sender].typ == 1
  if (block.timestamp - self.pooltime) > 36000 :
    send(msg.sender,self.balance)

@public
def part_to_vehicle(partid: uint256,vehicle_n: bytes32,_vehicle_id: uint256):
  assert self.auto_industry[msg.sender].typ ==2
  assert self.completeness[_vehicle_id]!=1
  self.vehicle[partid] = {vehicle_id: _vehicle_id,vehicle_name: vehicle_n}


@public
@constant
def check_part_location(partid: uint256) -> uint256:
  return self.vehicle[partid].vehicle_id

@public
@constant
def check_part_location2(partid: uint256) -> bytes32:
  return self.vehicle[partid].vehicle_name


@public
def vehicle_assembled(vehicle_id: uint256):
  self.completeness[vehicle_id]=1


@public
@payable
def __default__():
  pass
