// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// View functions ensure that they will not modify the state (return values)
// Pure functions ensure that they do not read or modify the state (return calculations)

contract MyContract {
    
    uint value;

    //getValue is a read-only function
    function getValue() external view returns(uint) {
        // eth call
        // value = 2
        return value;
    }

    function getNewValue() external pure returns(uint) {
        // This is a eth call function
        return 3 + 3;
    }

    // setValue modifies the state value whereas getValue function does not
    function setValue(uint _value) external {
        //This is a eth send function
        value = _value;
    }

    function multiply() external pure returns(uint) {
        return 3 * 7;
    }

    function valuePlusThree() external view returns(uint) {
        return value + 3;
    }
}

/*
Exercise
1. create a function called multiply which returns 3 * 7
2. create another function called valuePlusThree which returns the state variable value + 3
3. successfully deploy the contracts and test for results
***Remember*** to use the appropriate modifying keyword
*/