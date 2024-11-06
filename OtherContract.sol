// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./contracts/MyToken.sol";

contract callother {
    constructor() {

    }
    function payment() public payable { }
    function getOther() public view returns (bytes memory) {
        address CA=address(0x417Bf7C9dc415FEEb693B6FE313d1186C692600F);
        MyToken AO=MyToken(CA);
        return(AO.getData(1001));
        
    }
}