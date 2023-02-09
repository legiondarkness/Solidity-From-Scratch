// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// Function Modifiers are used to modify the behaviour of a function. 
// Function Modifiers are customizable modification for functions

contract Owner {
    //function modifiers 

    address owner;

    constructor() public {
        owner == msg.sender;
    }

    modifier onlyOwner {
        // customizable logic to modifiy our functions
        require(msg.sender == owner);
        _;
        // the underscore continues with the function, if it is not then it is not going to continue with the function
    }

    modifier costs(uint price) {
        //msg.value: the amount in wei being sent with a message to a contract
        require(msg.value >= price);
        _;
    }

}

// "is" is a keyword grabbing inheritance from another contract
contract Register is Owner {

    //what in this code is currently modifying the functions?
    mapping (address => bool) registeredAddress;
    uint price;

    constructor(uint initialPrice) public {
        price = initialPrice;
        }


// function register will set msg.sender (current caller) to true
    function register() public payable costs(price) {
        registeredAddress[msg.sender] = true;
    }

// onlyOwner is our function modifier that requires 
// only the owner to be able to change the price
    function changePrice(uint _price) public onlyOwner {
        price = _price;
    }
}

/* Exercise
1. create a function modifier called costs for our register function that checks to see 
that the sender value (hint look up msg.value) requires to be 
greater than or equal to the price 
Hint: The function modifier should take an argument.
*/