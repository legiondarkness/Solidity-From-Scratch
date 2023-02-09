// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/* 
Destructuring Assignments and Solidity Tricks

Solidity functions can return multiple variables of different types.
If you only want to keep one variable, then you can declare a variable and then use commas:
*/

contract DestructuringFunctions {

    uint public changeValue;
    string public tom = 'Hello!';

    function f() public pure returns(uint, bool, string memory) {
        return (3, true, 'Goobye!');
    }

    // Lets say we got 3 variables like above but we wanna only return 1 of it
    function g() public {
        (changeValue,,) = f(); //2 commas required - To tell solidity that I do not want the boolean and string AKA add the number of arguments to let the function run
    }

    function h() public {
        (,, tom) = f();
    }
}