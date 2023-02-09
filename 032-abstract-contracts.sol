// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
Abstract Contracts

 Abstract Contract is one which contains at least one function without any implementation
 Such a contract is used as a base contract -> 
 Generally an abstract contract contains both implemented as well as abstract functions
 Derived contract will implement the abstract function and use the existing functions as and when required

 virtual: used on abstract contracts functions which do not have implementations
 override: to be used on derived contracts function which duplicates the function in abstract contract
*/

// base
abstract contract X {

    // since the function has no implementation we should mark it as virtual
    function y() public view virtual returns(string memory);
}


// Derive
contract Z is X {

    // If we are rewriting it, we need to include 'override' to override the abstract contract
    function y() public override view returns(string memory) {
        return 'hello';
    }
}

// Technically contract is still abstract since it has at least one function without a body
// Base Contract
contract Member {
    string name;
    uint age = 38;

    // Because function setName has no body, the contract is now abstract
    function setName() public virtual returns(string memory) {} 
    // We do not need to statically label contract as "Abstract" because we used curly brackets

    function returnAge() public view returns(uint) {
        return age;
    }
}

// Derived contract
contract Teacher is Member {
    
        function setName() public view override returns(string memory) {
            return 'Gordan';
        }
}

// EXERCISE

abstract contract Calculator {
    
    function checkUint() public virtual view returns(uint);
}

contract Test is Calculator {
    
    function checkUint() public override pure returns(uint) {
        uint a = 1;
        uint b = 2;
        uint result;
        result = a + b;
        return result;
    }
}