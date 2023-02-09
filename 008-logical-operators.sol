// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * Logical operators
 Operator	Denotation	Description
Logical AND	&&	Returns true if both conditions are true and false if one or both conditions are false
Logical OR	||	Returns true if one or both conditions are true and false when both are false
Logical NOT	!	Returns true if the condition is not satisfied else false
 */

contract LogicalOperators {
    uint256 public a = 5;
    uint256 public b = 10;

    // logical not
    function logicalNot() public view returns (bool) {
        if (!(a > b)) {
            return true;
        }
        return false;
    }

    // AND: &&
    function logicAND() public view returns (bool) {
        // both conditions must be fulfilled
        if ((a > b) && (a == b)) {
            return true;
        }
        return false;
    }

    // OR: &&
    function logicOR() public view returns (bool) {
        // atleast one condition should be fulfilled
        if ((a > b) || (a == b)) {
            return true;
        }
        return false;
    }
}