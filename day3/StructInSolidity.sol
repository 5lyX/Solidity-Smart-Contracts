//SPDX-License-Identifier:MIT

pragma solidity ^0.8.17;

contract SimpleStorage2 {

    uint256 favoriteNumber;

    //People public person = People({favoriteNumber: 2, name : "Peter"})

    mapping(string => uint256) public nameToFavoriteNumber; //just like dictionary

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    //uint256[] public favoriteNumbersList;
    //People[3] public people;  STATIC ARRAY!!
    People[] public people;      //DYNAMIC ARRAY

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        People memory newPerson = People({favoriteNumber: _favoriteNumber , name: _name });
        //People memory newPerson = People( _favoriteNumber , _name);  This also works the same

        people.push(newPerson);
        //people.push(People( _favoriteNumber , _name));   SINGLE LINE implementation
    
        nameToFavoriteNumber[_name] = _favoriteNumber;
    
    }


}