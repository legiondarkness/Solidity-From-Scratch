// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * Learn about arithmetic operators in solidity
 * Intro - Operators tell the compiler to perform specific
 * mathematical operation, logical or relational
 * operation and produce a suitable response

 Arithmetic Operators

These operators are used to perform arithmetic or mathematical operations. Solidity supports the following arithmetic operators : 

Operator	Denotation	Description
Addition	+	Used to add two operands
Subtraction	–	Used to subtract the second operand from first
Multiplication	*	Used to multiply both operands
Division	/	Used to divide numerator by denominator
Modulus	%	Gives the remainder after integer division
Increment	++	Increases the integer value by one
Decrement	—	Decreases the integer value by one
 */

contract LearnArithmeticOperators {
    uint256 public a = 5;
    uint256 public b = 10;

    function calculatorAdd() public view returns (uint256) {
        uint256 result;
        result = a + b;
        return result;
    }

    function calculatorMultiply() public view returns (uint256) {
        uint256 result;
        result = a * b;
        return result;
    }

    function calculatorSubtract() public view returns (uint256) {
        uint256 result;
        result = a - b;
        return result;
    }

    function calculatorDivide() public view returns (uint256) {
        uint256 result;

        // division by ZERO
        if (b != 0) {
            result = a / b;
        } else {
            result = 0;
        }
        return result;
    }

    function calculatorGetRemainder() public view returns (uint256) {
        uint256 result;
        result = a % b;
        return result;
    }

    // modulo trick
    // the goal is to find the remainder
    /*
        12 % 23
        1. divident = 12, divisor = 23
        2. q = 12 / 23, q = 0
        3. 0 * 23 = 0, newResult = 0
        4. 12 - 0, remainder = 0
    */

    function calculatorIncrement() public returns (uint256) {
        return a++;
    }

    function calculatorExpression() public view returns (uint256) {
        return (a + b) * 3 - 10;
    }
}