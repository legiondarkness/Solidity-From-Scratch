// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 Error Handling in Solidity
 Solidity has functions that help in error handling
 A way of tackling this is that when an error happens, the state reverts back to its original state. 
    Below are some of the important methods for error handling:

    assert(bool condition) − In case condition is not met, this method call causes an 
    invalid opcode and any changes done to state got reverted. This method is to be used for internal errors.

    require(bool condition) − In case condition is not met, this method call reverts to original state. 
    - This method is to be used for errors in inputs or external components.

    require(bool condition, string memory message) − In case condition is not met, this method call reverts to original state. 
    - This method is to be used for errors in inputs or external components. It provides an option to provide a custom message.

    revert() − This method aborts the execution and revert any changes done to the state.

    revert(string memory reason) − This method aborts the execution and revert any changes done to the state. 
    It provides an option to provide a custom message.
 */

contract LearnErrorHandling {
    bool public sunny = true;
    bool umbrella = false;
    uint finalCalc = 0;

    // solar panel machine (A solar panel needs sun)
    function solarCalc() public {
        require(sunny, 'It is not sunny today!');
        finalCalc += 3;
    }

    // finalCalc can never equal 6
    function internalTestUnits() public {
        assert(finalCalc != 6);
    }

    // machine that controls the weather
    function weatherChanger() public {
        sunny = !sunny; // setting the true value to false
    }

    // grab finalCalc
    function getCalc() public view returns(uint) {
        return finalCalc;
    }

    function bringUmbrella() public {
        if(!sunny) {
            umbrella = true;
        } else{
        revert('No need to bring an umbrella today');
        }
    }
}

contract Vendor {
    address seller;

    modifier onlySeller {
        require(seller == msg.sender);
        _;
    }

    function becomeSeller() public {
        msg.sender == seller;
    }

    function sell(uint amount) payable public onlySeller {
        if(amount > msg.value) {
            revert('There is not enough ether provided!');
        }
    }
}