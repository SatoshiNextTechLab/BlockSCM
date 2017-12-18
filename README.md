
1. [Link to demo-video](https://youtu.be/MDTmZL2sXgk)<br>
2. [Link to contract deployed & tested on the Ropsten network](https://ropsten.etherscan.io/tx/0x04410d805f46d05dccd69c5e2a6a7c26d76cbf9403c4792658720df9eb93c1d3) <br>

## BlockSCM - Supply Chain Management 3.0
The Automobile industry's supply chain is massive logistical arrangment that is an integral part of any automobile manufacturing company. It mediates between multiple parties, and optimizes the creation of distribution of resources, but the presence of numerous interacting parties, differential pricing, and quality & complicance issues create a logistical nightmare which wastes both time and resources. The [failure of Boeing's supply chain for 787](http://www.maxqtech.com/3-true-stories-of-supply-chain-management-disasters-and-how-to-avoid-them/) led to a disastrous 3 year delay of their product. Using that as a case-study, we show blockchains are currently the best-suited solution to the problems in current supply chain infrastructure.

### The Problem
1. **Differential Pricing**: Companies prefer keeping their pricings a secret, since this allows them to pay lower prices when outsourcing to developing countries.
2. **Numerous Parties Invovled**: Mediating between so many parties can be a big problem for logistics-providers, slowing down the delivery of services and creating a large overhead for logistics. Furthermore, a centralized mediator of these parties can misuse power to perfer some parties over others.
3. **Quality & Compliance issues**: Procuring a replacement for defective parts is a long-drawn and uncomfortable process.
4. **Inevitable disruptions**: LEAN "on-demand" manufacturing falls flat in a situations where natural disasters and socio-economic problems are common. For example, Japan (frequently affected by earthquakes) has outsourced most of it's supply chain logistics to other countries.
7. **Centralization**: A central mediator for parties is required, which centralizes power in the hands of a few and is a gateway to misuse of resources.
8. **Fraud by Middlemen**: As number of interacting parties increase, there is a proportional increase in middlemen. They lead to fraud and slow down the supply without adding anything to the network.
9. **Tracking history of any product**: Validating identity vendor and checking for tampering by middlemen is not possible.

### How does our solution help?

| Problems | How our solution solves them |
| --- | --- |
| **Differential Pricing** | Permissioned ledger for confidential transactions between parties |
| **Numerous parties invovled** | Consensus between multiple parties is maintained through Smart Contracts |
|  **Quality & Compliance issues** | Smart contract stores money while all solutions are checked and tested |
| **Inevitable disruptions** | Digital ledger is free of geographical constraints like natural disasters, socio-economic issues |       
| **Procuring replacements for defective pieces** | Smart contract only lets out payments once both parties satisified |
| **Centralization** | Risk of fraud is mitigated by using decentralized nodes for checking delivery status |
| **Fraud by Middlemen** | Because of using doubly-signed smart contracts, no financial fraud by middlemen can occur in the system |
| **Tracking supply-chain history of each part** | Using our network's merkle trees we can verify vendor identity and validity of product |

### Protocol

1. Manufacture requests parts from OEM.
2. 
3. 
4. 

This protocol has been implemented as a smart contract, and has been optimized for the use-case of automobile supply chains. It has been **deployed and tested** on the Ropsten network. The link to that deployed contract can be [found here](https://ropsten.etherscan.io/tx/0x04410d805f46d05dccd69c5e2a6a7c26d76cbf9403c4792658720df9eb93c1d3).


<solution>
As we observe, the problems are both financial (interests, maintenance of accounts) and organisations (central authority => corruption). Blockchains are a unique solution which addresses both these issues. ***Blockchains are a fundamentally new way of not just organising financial capital but also social capital.*** A new way of organising finances and power in rural microfinancial groups.

__**To solve these problems, we've created an Aadhar-linked digital pan-Indian capital-pooling network. Through this network, MAXIMUM POSSIBLE microloan requests are fully funded with 0% interest (least request satisfied first) and the reserve wealth is re-distributed into the system.**__ People can exit the network by requesting their deposited money, which they’ll receive once the loans given are repayed back. This systems allows workers to not only fund each other, but also get microloans for seed-funding their own businesses.

This allows villagers all across India to pool their resources and receive **interest-free microloans** from the network. Blockchain tech enables micro-transactions (which allows for a greater inclusion for poverty-stricken individuals), automatic bookkeeping (no delay or pathy maintenance of ledgers on-chain) in a transparent (all chain transactions are open) manner. We remove the need for a group managing authority (decentralized smart contract). By needing consent from previous members to enter the network and making them accountable for him, **we introduce peer pressure into the network**. This [lowers chances of non-repayment of loans](https://www.microfinancegateway.org/library/microfinance-and-mechanics-solidarity-lending-improving-access-credit-through-innovations).


### GUI interface of our hack
<img src="https://raw.githubusercontent.com/SatoshiNextTechLab/TheSpareRoute/master/GUI%20SCM.png">


## Architecture and Tech-stack

![System Architecture](https://raw.githubusercontent.com/SatoshiNextTechLab/TheSpareRoute/master/UML%20SCM.jpg)


### Architecture Modules
1. **Add parts** - The OEM uses the function Add parts for adding the produced spare part with its name,quantity,ID and price per unit.
2. **Buy parts show price** - The Automobile Manufacturer finds the price he has to pay by calling this function with the name and number of part he needs.
3. **Use OEM parts** - The Automobile Manufacturer pays money temporarily for the parts only if the parts are found to be genuine.
4. **Pay to OEM** - The OEM can call this function to claim the money for the parts only after 10 hours from the time the Manufacturer pays(if defective products are found the Manufacturer refunds the part).
5. **Part to vehicle** - This function is used to assign the part to the Vehicle in which the part is to be installed.
6. **Check part location** - This function is used to check the vehicle in which the part is installed.
7. **Vehicle assembled** - This function is used to set the vehicle as manufactured completely and ready to be sent to the dealer.
8. **Showroom** - The Dealer and client can get the final vehicle from here.

### Tech Stack
1. Ethereum smart constracts (in solidity)
2. Ropsten testnet  
3. Truffle framework
4. MetaMask
5. Remix IDE
6. Web3.js

##### Steps to compile in Truffle
1. git clone https://github.com/jangidkrishna/0xSHG.git
2. truffle compile
3. truffle migrate
4. truffle console
5. Interact using Web3.js

##### Steps to compile GUI
1. clone repo https://github.com/jangidkrishna/0xSHG.git
2. cd into TheSpareRoute-master/GUI
2. npm install .
3. npm install lite-server --save-dev
3. npm run dev

## Built by undergraduates at [Next Tech Lab, SRM University](http://nextech.io/index2.html)
