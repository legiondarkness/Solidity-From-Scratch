// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/*
        The Withdrawal Pattern

Instead of using transfer which reverts the code we can use send which returns a bool

Write a function so only the owner can send tatianna funds with the send method with logic to set up what happens if the amount 
is not sent to Tatianna
*/

    function sendRefund() public onlyOwner returns(bool success) {
        if(!tatianna.send(amount)) {
        // do something with the failure
        
    }
}

/*
Write a withdrawal function so that the investors can withdraw funds on their own
through that functionality. Let them do it themselves

EXERCISE: Write a function called claimRefund which requires that the balance of the msg.sender
to be greater than 0 and transfer the balanceto the current caller. Pseudo balance
var named balance
*/

    function claimRefunds() public {
        require(balance[msg.sender] > 0);
        msg.sender.transfer(balance[msg.sender]);
    }

// By the customer working directly to claim a refund with their contract address we eliminate the outside interference

/* Exercise time! It is not safe to interact with more than one customer at a time
So write a function to return funds using the withdrawal pattern

1. Write a function called withdrawFunds that takes an amount and returns bool success in the signature
2. Require that the balance of the current caller is greater than or equal to that amount
3. Subtract the amount from the balance of the current sender
4. Transfer the amount over and return the trueness of the function
*/

function withdrawFunds(uint amount) public returns(bool success) {
    require(balance[msg.sender] >= amount);
    balance[msg.sender] -= amount;
    msg.sender.transfer(amount);
    return true;
}