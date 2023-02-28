// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/CaughtWithTest.sol";

contract CaughtWithTestTest is Test {
    CaughtWithTest public caughtWithTest;

    function setUp() public {
        caughtWithTest = new CaughtWithTest();
    }

    function testIncrement() public {
        uint256 myNumber = 55;
        caughtWithTest.setNumber(myNumber);
        assertEq(myNumber, caughtWithTest.number());
    }
}
