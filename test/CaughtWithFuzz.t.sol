// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/CaughtWithFuzz.sol";

contract CaughtWithFuzzTest is Test {
    CaughtWithFuzz public caughtWithFuzz;

    function setUp() public {
        caughtWithFuzz = new CaughtWithFuzz();
    }

    function testFuzz(uint256 randomNumber) public {
        uint256 returnedNumber = caughtWithFuzz.doMoreMath(randomNumber);
        assert(returnedNumber != 0);
    }
}
