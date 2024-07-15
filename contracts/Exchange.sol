// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./HotToken.sol";
import "./ColdToken.sol";


contract Exchange is Context {
    address payable admin;

    ColdToken public tokenCOLD;
    HotToken public tokenHOT;
    constructor(address _tokenCOLD, address _tokenHOT) {
        tokenCOLD = ColdToken(_tokenCOLD);
        tokenHOT = HotToken(_tokenHOT);
    }

    modifier onlyAdmin() {
        payable(msg.sender) == admin;
        _;
    }

    function exchangeCOLDToHOT(uint256 amount) public {
        // Ensure the sender has enough ColdToken to exchange
        require(tokenCOLD.balanceOf(_msgSender()) >= amount, "Insufficient ColdToken balance");

        // Transfer ColdToken from the sender to this contract
        require(tokenCOLD.transferFrom(msg.sender, address(this), amount), "Transfer of ColdToken failed");

        // Calculate the equivalent amount of HotToken to exchange
        uint256 equivalentAmount = amount * tokenCOLD.tokenPrice() / tokenHOT.tokenPrice();

        // Transfer HotToken from this contract to the sender
        require(tokenHOT.transfer(_msgSender(), equivalentAmount), "Transfer of HotToken failed");
    }

    function exchangeHOTToCOLD(uint256 amount) public {
        // Ensure the sender has enough HotToken to exchange
        require(tokenHOT.balanceOf(_msgSender()) >= amount, "Insufficient ColdToken balance");

        // Transfer HotToken from the sender to this contract
        require(tokenHOT.transferFrom(msg.sender, address(this), amount), "Transfer of ColdToken failed");

        // Calculate the equivalent amount of ColdToken to exchange
        uint256 equivalentAmount = amount * tokenHOT.tokenPrice() / tokenCOLD.tokenPrice();

        // Transfer ColdToken from this contract to the sender
        require(tokenCOLD.transfer(_msgSender(), equivalentAmount), "Transfer of HotToken failed");
    }

    // Buy tokens to exchange contract
    function buyTokensCOLD(uint256 amount) public payable onlyAdmin {
        tokenCOLD.buyTokens{value: msg.value}(amount);
    }

    function buyTokensHOT(uint256 amount) public payable onlyAdmin {
        tokenHOT.buyTokens{value: msg.value}(amount);
    }
}
