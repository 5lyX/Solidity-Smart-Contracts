// Get funds from users
// Withdraw Funds
// Set a minimum funding value in USD

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe {

    // costant , immutable : keywords are used for GAS OPTIMISATION

    using PriceConverter for uint256;

    //uint256 public number;

    uint256 public constant MINIMUM_USD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;    
    }

    error NotOwner();

    function fund() public payable{
        // Want to be able to set a minimum fund amount in USD
        // 1. How do we send ETH to this contract?
        //number = 7; //will be reverted if condition not met
        //require(msg.value > 1e18, "Didn't send enough"); //1e18 = (1 * 10) **18 = 1000000000000000000
        
        //msg.value.getConversionRate();
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough!");
        //What is reverting?
        // undo any action before, and send remaning gas back
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    

    function withdraw() public onlyOwner {
        //require(msg.sender == owner, "Sender is not owner!!");
        
        // for loop
        // [1,2,3,4]
        // 0,1,2,3
        //for ( starting index,ending index,step amount )
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            //code
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset the array
        funders = new address[](0);   //reset the array and starts with 0 element in it 
                                      //will also work for 1-> 1 Element , 2-> 2 element etc
        // actually withdraw the funds

        // transfer
        // send
        // call

        // msg.sender -> type : address
        // payable(msg.sender) -> type : payable address 

        // // transfer
        // payable(msg.sender).transfer(address(this).balance);
    
        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed!!");

        //call
        (bool callSuccess,) = payable(msg.sender).call{value : address(this).balance}("");
        require(callSuccess, "Call Failed");
    }

    modifier onlyOwner {
        //require(msg.sender == i_owner , "Sender is not owner !!");
        if(msg.sender != i_owner) { revert NotOwner();}
        _;
    }

    //What happens if someone sends this contract ETH without calling the fund function??

    receive() external payable {
        fund();          //if someone directly sent us fund it will reroute them to fund() function
    }

    fallback() external payable {
        fund();
    }
}