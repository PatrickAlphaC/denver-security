// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CaughtWithTest {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        // Whoops, this isn't right!
        number = newNumber + 1;
    }
}




