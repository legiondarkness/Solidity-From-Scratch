// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;
/**
  Restricted Access
 
  By Default a contract is made read-only unless it is specified a public
  We can restrict who can modify a contract's state or call a
  function using modifiers.

  Let us build a contract with modified restricted access with the following common writeouts:
        onlyBy - only the mentioned caller can call this function
        onlyAfter - called after a certain period of time 
        costs - call this function only if certain value is provided
 */

 contract RestrictedAccess {

   address public owner = msg.sender;
   uint public creationTime = block.timestamp;

    // Write a modifier that will require the current caller to be equal to
    // an account address which we set as an input in the modifier and if the 
    // requirement fails send a message that says - Sender not authorized
    modifier onlyBy {
      require(msg.sender == owner, 'Sender not authorized');
      _;
    }

    modifier onlyAfter(uint _time) {
      require(block.timestamp >= _time, 'function is called too early'); 
      _;
    }

    modifier costs(uint _amount) {
      require(msg.value >= _amount, 'Not enough Ether provided');
      _;
    }

    // Write a function that will change the owner address
    function transferOwnership(address _newAddress) onlyBy public  {
      owner = _newAddress;
   }

    // Write a function that can disown the current owner
    // Only run the function 3 weeks or 5 seconds after the creation of the contract
    function disOwn() onlyBy onlyAfter(creationTime + 5 seconds) public {
      delete owner;
    }

    function forceOwnerChange(address _newOwner) costs(200 ether) payable public {
      owner = _newOwner;
    }
   
   /*Exercise Time
   1. Create a modifier called costs with takes an _amount
   2. Require that msg.value is greater than or equal to the amount
   3. If the msg.value is not greater than or equal to the amount return a string that says Not enough
   4. Write a function called forceOwnerChange which takes an address called _newOwner and is payable
   5. Add a modification to the signature so that the function needs 200 ether to execute
   6. Set the owner of the contract to the new owner of the address

   7. BONUS*** Figure out how to make the function actually run (BRAINSTORM: Create a transfer method to transfer ether)
  */
 }