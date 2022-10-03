// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        // How does storage factory know what simple storage look like
        SimpleStorage simpleStorage = new SimpleStorage(); //saving it as a memory variable
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Adress
        // ABI -- Application Binary Interface
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];  //Simple Storage Object
        return simpleStorage.retrieve();
    }

}