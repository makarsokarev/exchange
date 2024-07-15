// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract HotToken is ERC20 {
    uint256 public tokenPrice;
    uint256 public tokensSold;

    constructor(uint256 initialSupply, uint256 _tokenPrice)
        ERC20("HotToken", "HOT") 
    {
        tokenPrice = _tokenPrice;
        _mint(address(this), initialSupply);
    }

    // Performs multiplication and checks for overflow.
    function mul(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require(y == 0 || (z = x * y) / y == x, "ds-math-mul-overflow");
    }

    function buyTokens(uint256 numberOfTokens) external payable {
        // Require tha value sent is equal to token price
        require(msg.value >= mul(numberOfTokens, tokenPrice), "amout of send is not equal to token price");

        // Require that a contract have enough tokens
        require(this.balanceOf(address(this)) >= numberOfTokens, "contract does not have enough tokens");

        // Trigger transfer event
        require(this.transfer(msg.sender, numberOfTokens));

        // Keep track of number of tokens sold
        tokensSold += numberOfTokens;
    }
}
