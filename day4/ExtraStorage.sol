// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol"; //import function is same as copying pasting the entire file


// Inheritance Implemented

contract ExtraStorage is SimpleStorage {
    // + 5 in original favourite Number 
    // override
    // keywords to be used : virtual : in original function , to be overriden 
    //                       override : overriding function requires
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}