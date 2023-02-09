// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
INTERFACES

 Interfaces are similar to abstract contracts and are created using interface keyword
 Following are the key characteristics of an interface:
    
    Interface can not have any function with implementation

    Functions of an interface can be only of type external.

    Interface can not have constructor

    Interface helps to makes contract smaller and easier to read without the need of inheritance

    Interface can not have state variables

    Interface can have enum, structs which can be accessed using interface name dot notation.
*/

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

// TO react with the above contract without copy and pasting the code, we need an Interface

interface ICounter {
    function count() external view returns(uint);
    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    // to execute copy the address of the Counter contract
    // and feed into the parameters of the functions defined
    // at MyContract
    function getCount(address _counter) external view returns(uint) {
        return ICounter(_counter).count();
    }
}

/*
Exercise Interfaces with Uniswap (DEX)
In uniswap each Uniswap smart contract, or pair, manages a liquidity pool made up of reserves of two ERC-20 tokens!
In this exercise you are going to use the IDE to speak to Uniswap and get the reserves of a Uniswap pair of your choosing

 1. Create two interfaces which each hold separate function signatures you must look up in the Solidity docs V2
 2. One interface will be called UniswapV2Factory which will contain the function signature that gets pairs
 3. Another interface will be called UniswapV2Pair which will contain the function signature to get reserve values
 4. Create a contract which contains addresses of the paired tokens you choose as well as the factory address
 5. Within the contract make a function which can successfully get the pair of your tokens and set it to a single address
 6. Use that address to get the reserves values and finally return the reserve values
 7. Switch to Mainnet and connect Metamask but DO NOT deploy the contract
 8. From the mainnet manually go through the steps of retrieving the values without deploying or spending gas

*/

interface UniswapV2Factory {
    //retrieved from https://docs.uniswap.org/contracts/v2/reference/smart-contracts/factory
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

interface UniswapV2Pair {
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract Check {

    //UniswapV2Factory is deployed at 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f on 
    //the Ethereum mainnet, and the Ropsten, Rinkeby, Görli, and Kovan testnets. It was built from commit 8160750.
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;

    address private DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getReservedTokens() external view returns (uint, uint) {

        // We are now accessing the data from the uniswapv2Factory
        address pair = UniswapV2Factory(factory).getPair(DAI, weth);

        // getting the reserves
        (uint256 reserve0, uint256 reserve1, ) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }
}