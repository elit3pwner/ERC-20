//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {MyToken} from "../src/MyToken.sol";

contract TestMyToken is Test {
    // contract to deoply MyToken
    MyToken public myToken;
    uint256 public totalSupply = 100000;
    string public name = "Pwner";
    string public symbol = "PWN";

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    function setUp() public {
        myToken = new MyToken(totalSupply, name, symbol, address(this));
        myToken.transfer(bob, 10000);
    }

    function testApprove() public {
        // Bob approves Alice to spend 5000 tokens
        vm.prank(bob);
        myToken.approve(alice, 5000);

        // Alice performs transferFrom from Bob to herself
        vm.prank(alice);
        myToken.transferFrom(bob, alice, 5000);

        // Check token balances
        assertEq(myToken.balanceOf(alice), 5000);
        assertEq(myToken.balanceOf(bob), 5000);
    }
}
