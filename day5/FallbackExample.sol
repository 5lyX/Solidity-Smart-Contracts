// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FallbackExample {
    uint256 public result;

    //receive function is triggered any time we send a trasaction 
    //no matter is if send 1 or zero ETH to contract
    receive() external payable {
        result = 1;
    }

    fallback() external payable {
        result = 2;
    }
}

// Ether is sent to a contract

//        is msg.data empty?
//            /         \
//          yes         no
//         /              \
//     retrieve()?       fallback()
//        /    \
//       yes   no
//      /       \
// retrieve()   fallback()
//