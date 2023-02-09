// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/* 
Special variables (global variables) are globally available variables and provides information about the blockchain

EXAMPLE:
msg.sender: Sender of the message (current call), 
msg.value (uint): Number of wei sent with the message
block.timestamp: Current block timestamp as seconds since unix epoch, 
block.numer (uint):current block number
*/

contract LedgerBalance {
//create a map of wallets with amounts
// set up a function that can update the amount of the person calling the contract

    mapping(address => uint) balance;
    
    function updatesBalance(uint newBalance) public {
        balance[msg.sender] = newBalance;
    }

// 1. create a new contract called Updated 
// 2. Create a public function called updatesBalance
// 3. Instantiate the data type contract LedgerBalance to a new variable called ledgerbalance (similar to struct or enum)
// 4. Set the new variable ledgerBalance = new LedgerBalance()
// 5. Update the ledgerbalance to 30
// 6. deploy both contracts and then update the ledger balance by 30 using the Updated contract
}

contract Updated {
    
    function updatesBalance() public {
        LedgerBalance ledgerBalance = new LedgerBalance();
        ledgerBalance.updatesBalance(30);
    }
}


// OTHER Global Variable Examples!

contract SimpleStorage {
    
    uint storedData;
    
    function set(uint x) public {
        storedData = block.difficulty;
    }

    function get() public view returns(uint) {
        return storedData;
    }
}