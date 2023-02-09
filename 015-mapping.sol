// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/*
Mapping is a reference type as arrays and structs. Following is the syntax to declare a mapping type.
Mapping allows you to save data and add a key that you specify and retrieve that info later.
Similar to struct or an array - it is a reference type
In solidity, you can't iterate through a map - you need to store the keys in an array and you can't give size
*/

// get set and delete a value from mapping 

contract learnMapping {

    // key and value - key can be string uint or bool - value can be anything 
    //you create a library that has keys and values assigned 
    mapping(address => uint) public myMap;
    
    function getAddress(address _addr) public view returns(uint) {
        return myMap[_addr];
    }

    function setAddress(address _addr, uint _i) public {
        myMap[_addr] = _i;
    }

    function removeAddress(address _addr) public {
        delete myMap[_addr];
    }

/* Mapping ASsignment:
0. Create a unique data type as a struct called Movie and give it the string properties: title and director
1. Create a map called movie which takes uint as a key and movie as a value
2. create a function called addMovie which takes three inputs, movie id, title and director which assigns a value of an integer to a movie added back to the movie map. It should include
a title and director name
3. Deploy the contract and update the movie information to the movie map with our favorite movies
*/

    mapping(uint => Movie) movie;
    mapping(address => mapping(uint => Movie)) public myMovie;

    struct Movie {
        string title;
        string director;
    }

    function addMovie(uint id, string memory title, string memory director) public {
        movie [id] = Movie(title, director);
    }

    function addMyMovie(uint id, string memory title, string memory director) public {
        myMovie[msg.sender][id] = Movie(title, director);
    }
}
contract allowance {
    mapping (address => uint) owner;
    mapping (address => mapping (address => uint)) spender;

    function pairup(uint _id, address _addrOwner, address _addrSpender) public {
        spender[_addrOwner][_addrSpender] = _id;
    }
    function getpairup(address _addrOwner, address _addrSpender) public view returns(uint){
        return spender[_addrOwner][_addrSpender];
    }
 
    //this function removes the spenders allowance
    function remove(address _addrOwner, address _addrSpender) public {
        delete spender[_addrOwner][_addrSpender];
    }
}

// NESTED mapping (maps within maps)
// what if you wanted to store movies that belong to a certain person, thing or address
// another example - allow one address to spend on behalf of another address (ERC20 tokens)
// ex: mapping(key => mapping(key2 => value2)) nestedMap