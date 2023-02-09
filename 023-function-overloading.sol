// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/**
  Function overloading in solidity
  You can have multiple definitions for the same function name in the same scope
 
  BUT The definition of the function must differ from each other by types and/or
  the number of arguments in the argument list
  Also, the type of the arguments can be different.
 
 * NOTE: You cannot overload function declarations that differ only by return type
 */

 contract FunctionOverloading { 
     function x(bool lightSwitch) public {

     }
    function x(uint wallet) public {

    }
 }

 /*
 Exercise:
 1. Create two functions with the sanme name that return the sum of their arguments -
 2. One function which takes two arguments and another function which takes three arguments
 3. Create two additional functions which can call each sum function and return their various sums
 4. Successfully deploy your contract and test the results of overloading functions
 */

contract FunctionTesting {

    function sumOne(uint a, uint b) public pure returns(uint256)  {
        return a + b;
    }

    function sumTwo(uint a, uint b, uint c) public pure returns(uint256) {
        return a + b + c;
    }

    function callSumOne() public pure returns(uint) {
        return sumOne(2,3); 
    }

    function callSumTwo() public pure returns(uint) {
        return sumTwo( 2,3,3); 
    }
}

