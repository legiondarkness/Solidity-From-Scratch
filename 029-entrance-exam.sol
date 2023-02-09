// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
Observe: The contract in Solidity is similar to a Class in C++

    Constructor − A special function declared with constructor keyword which will be 
    executed once per contract and is invoked when a contract is created.

    State Variables − Variables per Contract to store the state of the contract

    Functions − Functions per Contract which can modify the state variables to alter the state of a contract
    
Recall Visibility Scope Keywords:

    external − External functions are meant to be called by other contracts. 
    They cannot be used for internal call. To call external function within contract this.function_name() call is required. 
    State variables cannot be marked as external.

    public − Public functions/ Variables can be used both externally and internally. 

    internal − Internal functions/ Variables can only be used internally or by derived contracts.

    private − Private functions/ Variables can only be used internally and not even by derived contracts.
    
    RECALL THE FOLLOWING:
*/

contract C {

    uint private data;
    uint public info;

    constructor() {
        info = 10;
    }

    function increment(uint a) private pure returns(uint256) {
        return a + 1;
    }

    function updateData(uint a) public {
        a = info;
    }

    function getData() public view returns(uint) {
        return data;
    }

    function compute(uint a, uint b) internal pure returns(uint) {
        return a + b;
    }
}

contract D {

    //Grab contract C and set it to a new variable "c" and the new instance known as the new contract of C
    C c = new C();
    

    function readInfo() public view returns(uint256) {
        return c.info(); // small letter c is because our c have grabbed all the infromation from contract C
    }
}

contract E is C { // When we inherit this and set the new constructor, every functions from C will move into E too
    uint private result;

    // Create a private variable c which inherits contract C
    C private c; 

    constructor() {
        c = new C();
    }

    function getComputedResult() public {
        result = compute(23, 5);
    }

    function getResult() public view returns(uint) {
        return result;
    }

    function getNewInfo() public view returns(uint) {
        return info;
    }
 
}