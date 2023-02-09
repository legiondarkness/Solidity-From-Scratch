// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;
/*
For a crypto contract, the contract allows only its creator to create (mint) new coins 
Anyone can send coins to each other without a need for registering with a username and password, all you need is an Ethereum pair
*/

contract Coin {
    // the keyword public is making the variables here accessible from other contracts
    address public minter;
    mapping(address => uint) public balances; // Set address to a keystore value: integers && Why is it address? Because it carries the number (balance)

    //How to send tokens
    event Sent(address from, address to, uint amount);
    /* Event is an inheritable member of a contract. An event is emitted, it
    stores arguments passed in transaction logs. These logs are stored on blockchain and
    are accessible using address of contract
    */

    // constructor only runs when we deploy a contract
     constructor() {
        minter == msg.sender; // This constructor sets the person who deploys the contract as the admin/minter
    }

    // We want this function to make new coins and send them to an address
    // Only the owner can send these coins
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    error insufficientBalance(uint requested, uint available);

    // create a function to send any amount of coins to an existing address
    function send(address receiver, uint amount) public {
        // require amount to be greater than x = true .... and then run this
        if(amount > balances[msg.sender]) 
        revert insufficientBalance({
            requested: amount,
            available: balances[msg.sender]
        });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}