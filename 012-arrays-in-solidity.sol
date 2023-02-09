// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * Working with arrays in solidity
 *
 * An array is used to store a fixed size, sequential collection.
 * of elements of the same type.
 * An array is used to store a collection of data.
 */

contract LearnArrays {
    uint256[] public myArray;
    uint256[] public myArray2;
    uint256[200] myFixedSizedArray;

    // addding elements to the array:
    // the push method adds one or more elemens to the end of an array
    // and returns the new length of the array.

    // function to push an element into the array
    function push(uint256 number) public {
        // using the push method
        myArray.push(number);
    }

    // function to pop/remove the last element from an array
    function pop() public {
        // using the pop() method
        myArray.pop();
    }

    // function to get the length of an array
    function getArrayLength() public view returns (uint256) {
        // using the length property to get the length of the array
        return myArray.length;
    }

    // get array element at a particular index
    function getElementAtIndex(uint256 i) public view returns (uint256) {
        return myArray[i];
    }

    // remove a element at a particular index
    function remove(uint256 i) public {
        // using the delete keyword
        // length of the array remains thesame
        // deleted number will be replaced with a zero
        delete myArray[i];
    }

// Exercise create a function that can fully remove an item from an erray

/*
1. Create an empty array called changeArray
2. Create a function called removeElement which sets the index argument of the array to the last element in the array
3. Remove the last index from that function with the pop method
4. Create a function called test which pushes 1 2 3 4 into changeArray
5. Remove the element 2 from the array when contract is called
*/

    uint256[] public changeArray;

    function removeElement(uint i) public  {
        changeArray[i] = changeArray[changeArray.length - 1];
        changeArray.pop();
    }

    function test() public {
        changeArray.push(1);
        changeArray.push(2);
        changeArray.push(3);
        changeArray.push(4);
    }

    function getChangeArray() public view returns(uint[] memory) {
        return changeArray;
    }
}