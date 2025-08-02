//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    constructor(uint256 totalSupply, string memory name, string memory symbol, address owner) ERC20(name, symbol) {
        _mint(owner, totalSupply);
    }
 
}