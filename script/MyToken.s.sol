//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Script} from "../lib/forge-std/src/Script.sol";
import {MyToken} from "../src/MyToken.sol";

contract DeployMyToken is Script{

    uint256 public initialSupply = 100000;
    string public name = "These Balls";
    string public symbol = "BALLS";
    function run() external{
        vm.startBroadcast();
        new MyToken(initialSupply, name, symbol, msg.sender);
        vm.stopBroadcast();
    }
}