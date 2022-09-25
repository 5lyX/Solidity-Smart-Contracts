//SPDX-License-Identifier: MIT

pragma solidity 0.8.17; //Hello this is a comment

contract SimpleStorage {
    // boolean, uint , int , address , bytes
    /* bool hasFavouriteNumber = false;
    uint256 favouriteNumber = 5; //can go from 8,16,32...
    string favouriteNumberInText = "Five";
    int256 favouriteInt = -5;
    address myAddress = 0x2524f2a5dd8eC0C449F79950eF24E4eF781aF2aB;
    bytes32 favouriteByte = "meow"; //32 is tha max size */

    uint256 public favoriteNumber; //Initialised to zero
                                    // default visibility is internal
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        //retrieve(); then it will cost us gas
    }

    //The more stuff you do in the function the more, the gas cost
    // function using the keyword "view" , only reads the value and doesn't cost gas
    // function using the keyword "pure" , can't read any data just perform some math
    // view , pure : no gas
   
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    function add() public pure returns(uint256) {
        return (1+1);
    }
}