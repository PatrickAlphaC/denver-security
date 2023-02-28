// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract CaughtWithFuzz {
    /*
     * @dev Should never return 0
     */ 
    function doMoreMath(uint256 myNumber) public pure returns(uint256){
        if(myNumber == 7){
            return myNumber + 78;
        }
        if(myNumber == 1238 ){
            return myNumber + 2 ;
        }
        if(myNumber == 7225 ){
            return (myNumber / 78) + 1;
        }
        if(myNumber == 75 ){
            return (myNumber % 75) + 17 - (1*1);
        }
        if(myNumber == 725 ){
            return (myNumber / 2) + 7;
        }
        if(myNumber == 123 ){
            return (myNumber / 2) + 7;
        }
        if(myNumber == 1234 ){
            return (myNumber / 2) + 7;
        }
        if(myNumber == 12345 ){
            return (myNumber / 2) + 7;
        }
        if(myNumber == 1 ){
            return (myNumber / 2) + 10 - 1 * 5;
        }
        if(myNumber == 2 ){
            return (myNumber % 2) + 6 - 1 * 5;
        }
        if(myNumber == 1265 ){
            return (myNumber % 1265) + 1 - (1*1);
        }
        return 1;
    }
}
