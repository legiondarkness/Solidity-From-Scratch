// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/* WHAT ARE UINTS???

The uint data type is an unsigned integer, meaning its value must be non-negative
There's also an indt data type for signed integers

Note: In solidity, unit is actually an alias for uint256, a 256-bit unsigned integer
You can declare uints with less bits - uint8, uint16, uint32, etc..
But in general you want to simply use uint except in specific cases
*/

// uint defaults uin256
// uint (alist for uint256) is a unsigned interger which has:
//  minimum value of 0
//  maximum value is 2^256 - 1 = // 78 decimals
contract learnConversions {

    // Conversion to smaller type costs higher order bits
    uint32 a = 0x12345678;
    uint16 b = uint16(a); // d = 0x5678

    //conversion to higher type adds padding bits to the left
    uint16 c = 0x1234;
    uint32 d = uint32(c); //d = 0x00001234

    //What is the cost? Costs higher order data
    // Conversion to smaller bytes costs higher order data
    bytes2 e = 0x1234;
    bytes1 f = bytes1(e); //f=0x12

    //What is the cost? Adds padding bits to the right
    bytes2 g = 0x1234;
    bytes4 h = bytes4(g);
}