// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract CaughtWithManualReview {
    /*
     * @dev adds 2 to numberToAdd and returns it
     */ 
    function doMath(uint256 numberToAdd) public pure returns(uint256){
        return numberToAdd + 1;
    }

    // We should write a test for every issue we find during manual review!
}
