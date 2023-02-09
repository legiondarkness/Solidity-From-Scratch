// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
Event Example:
Abstraction - Decentralized Exchange: On a smart contract, traders can trade tokens - from the smart contract 
emit an event so they can get the data (web front moble)

After emitting events you can't read them in the past only for entities outside of the blockchain - not stored as memory
- Events have lower gas cost than storage
*/

contract LearnEvents {

    // To create an event we consider 2 things
    // 1. Declare the event
    // 2. We want to emit the event
    event NewTrade(
        // indexed allows the outside consumer to filter out and get the information they need
        // indexed costs higher cost
        // only use 3 indexed per event
        uint indexed date,
        address indexed from,
        address to,
        uint indexed amount
    );

    //Create a function that trades
    function trade(address to, uint amount) external {
        // outside consumer can see the event through web3js
        // block.timestamp is a global variable that gives the current timestamp
        emit NewTrade(block.timestamp, msg.sender, to, amount);
    }
}