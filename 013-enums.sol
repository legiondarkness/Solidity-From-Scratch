// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/*Enums restrict a variable to have one of only a few predefined values. The values in this enumerated list are called enums
With the use of enums it is possible to reduce the number of bugs in your code 
enum for food app that offers either large medium or small */

contract enumsLearn {
    enum frenchFriesSize {LARGE, MEDIUM, SMALL}
    frenchFriesSize choice;
    frenchFriesSize constant defaultChoice = frenchFriesSize.MEDIUM;

    function setSmall() public {
        choice = frenchFriesSize.SMALL;
    }

    function getChoice() public view returns(frenchFriesSize) {
        return choice;
    }

    function getDefaultChoice() public view returns (uint) {
        return uint(defaultChoice);
    }
}

/*
1. Create an enum for shirts color called ShirtColor and set it to the options of either Red or White or BLUE
2. Create a data of shirtColor called defaultChoice which is a constant set to the color BLUE
3. Create a data of shirtColor called choice and don't initiate the value
4. Create a function called setWhite which changes the shirt color of shirtColor to white
5. create a function called getChoice which returns the current choice of shirtColor
6. create a function getDefaultChoice which returns the default choice of shirtColor
*/

contract shirtColour {
    enum shirtColor {RED, WHITE, BLUE}
    shirtColor choice;
    shirtColor constant defaultChoice = shirtColor.BLUE;

    function setWhite() public {
        choice = shirtColor.WHITE;
    }

    function getChoice() public view returns(shirtColor) {
        return choice;
    }

    function getDefaultChoice() public view returns(uint) {
        return uint(defaultChoice);
    }
}