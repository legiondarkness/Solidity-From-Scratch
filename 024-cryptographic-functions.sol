// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/**

 Cryptographic Functions
  A cryptographic has function(CHF) is a mathematical algorithm that maps data of arbitrary size
  (often called the "message") to a bit array of a fixed size (called the "hash" or "hash value" or "message digest")
  It is a one way function, that is, a function which is practically infeasible to invert or reverse the computation.
 
 Solidity provides inbuilt cryptographic functions as well. Below are some of the important methods it provides:
 * keccak256(bytes memory) returns (byte32) -computes the Keccak-256 hash of the input
 * sha256(bytes memory) returns (bytes 32) - computes the SHA-256 hash of the input
 * ripemd160(bytes memory) returns (bytes 20) - computes the RIPEMD-hash of the input

**/


/* EXERCISE: Create oracle contract (Secure the random functionality from Miner Manipulation)
1. Create a contract Oracle with an address datatype called admin and a public integer called rand
2. Create a constructor and set the admin to the current caller 
3. Write a function which takes the input of an integer and sets the state variable rand to that integer
4. Require that the current caller must be equal the admin.
5. Set the Oracle contract to a new variable called oracle in the GenerateRandomNumber contract
6. Write a new constructor in the GenerateRandomNumber contract which sets the oracle to a deployment address of the Oracle
7. Modify the hash return so that the miners lose control manipulation to the random generation
8. Successfully deploy and test the results
*/

// Oracle dynamic feeds 
/*
Oracles (a database managing system) are the dynamically changing outside data that we feed into smart contracts and they are very powerful
when it comes to fairness and intelligence of the smart contract and provides high performance, authorized access and failure recovery features. 
*/

contract Oracle {

    address admin;
    uint256 public rand;
    
    constructor() {
        admin = msg.sender;
    }

    function feedRand(uint _rand) external {
        require(msg.sender == admin);
        rand = _rand;
    }
}


contract GenerateRandomNumber {

    Oracle oracle; // setting the variable oracle to the contract Oracle (Do not have = sign)

    constructor(address oracleAddress) {
        oracle = Oracle(oracleAddress);
    }

    // Build a nrandom generator which takes an input range and uses cryptographic hashing:
    // modulo (%) - so by computing against the remainder we will be able to produce a random number with a range
    // cryptographic hashing

    function randMod(uint range) external view returns(uint) {
        // grab information from the blockchain (use ABI) randomly to generate random numbers - we need something dynamically changing
        // abi.encodePacked concatenates (link) arguments nicely
        return uint(keccak256(abi.encodePacked
            (
            oracle.rand, //use the rand from oracle contract
            block.timestamp, 
            block.difficulty, 
            msg.sender))) % range;
    }
}