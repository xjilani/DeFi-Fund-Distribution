// RubyToke ERC20 with 6 decimals
// update 18 return value to 6 in ERC20.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract ERC20RubyToken is ERC20 , Ownable {
    constructor(uint256 initialSupply) ERC20("Ruby", "RBY") Ownable(msg.sender)  {
        _mint(msg.sender, initialSupply);
    }
    function burn(uint256 value) public  onlyOwner {
        _burn(msg.sender, value);
    }
}