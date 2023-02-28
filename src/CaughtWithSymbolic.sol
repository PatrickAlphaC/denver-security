// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract CaughtWithSymbolic {

    function functionOne(int128 x) public pure {
        if (x / 4 == -2022) {
            revert(); // BUG
        }
    }

    function functionOneSymbolic(int128 x) public pure {
        if (x / 4 == -2022) {
            assert(false);
            revert(); // BUG
        }
        assert(true);
    }
}