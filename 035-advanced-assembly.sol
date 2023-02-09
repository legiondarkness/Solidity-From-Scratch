// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
Solidity provides an option to use assembly language to write inline assembly within Solidity source code

Assembly is a low level language that allows you to directly manipulate with the EVM

EVM = Smart contracts are not real code in the blockchain - 
solidity code is compiled to a lower level language
*/

contract LearnAssembly {

    function addToEVM() external {
        uint x;
        uint y;
        // uint z = x + y;

    // all of this is compiled to low level instructions (known as opcodes - in total there is around 100 opcodes)
    // How do we use assembly?
    assembly {
        // declares an assembly bloxk
        // inside we can manipulate variables declared outside 
        // no semi colon, = is acutally := and we can bring in opcodes
        let z := add(x, y)

        // if functions for
        // load data for a specific slot
        let a := mload(0x40)

        // store something temporarily to memory (Memory is temporary)
        mstore(a, 4)

        // persistance storage! 
        sstore(a, 100)
     }
     // in EVM everything is stored in slots of 256 bits (a uint occupies one slot) whereas mapping or array is several
   }

   function addToEVM2() public view returns (bool success) {
       uint size;
       address addr;

        //check whether an address contains any bytes of code or not
       assembly {
           size := extcodesize(addr)
       }
       if(size <= 0) {
           return true;
       }
       else {
           return false;
       }
   }

   function addToEVM3() external view  {
       bytes memory data = new bytes(10)

        // we can not convert this into a fixed size
        // this conversion will throw an error or will fail
        // bytes32 dataB32 = bytes32(data);

        bytes32 byteB32;

        assembly {
            byteB32 := mload(add(data, 32))
        }

        // but if we care only about the first 32 bytes we can use assembly!
    }