// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * Advanced Inheritance
 
  Inheritance is a way to extend functionality of a contract
  Solidity supports single as well as multiple inheritance
 
  OBSERVE: A contract in solidity is similar to a class in C++ --which ia a blueprint for an object
  Classes can inherit other classes, so can contracts inherit other contracts!
 
  REMINDER: A constructor is a special function declared with the constructor keyword which will be
  executed once per contract and is invoked when a contract is created.
 */

contract A {

    //Creating a state var Innerval and initializing it to 100
    uint  innerVal = 100;

    //Create a fully accessible function called innerAddTen which returns 10 to any given input
    function innerAddTen(uint _a) public pure returns(uint){
        return _a + 10;
    }
}

contract B is A { //When u inherit it from A (Public functions will be listed in B too)

    // Create a function which returns the calculation from the innerAddTen function in contract A
    // to any given input
    function outerAddTen(uint _b) public pure returns(uint256) {
        return A.innerAddTen(_b);
    }

    //Create a function which returns the value of innerVal from contract A
    function returnInnerVal() public view returns(uint) {
        return A.innerVal;
    }
}