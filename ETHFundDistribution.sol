//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
// import "@openzeppelin/contracts/access/Ownable.sol";
contract DeFiFundDistribution {
    address owner;
    constructor(address owner_){
        owner=owner_;
    }
    modifier  onlyOwner {
        require(msg.sender==owner,"Your are not authorize person");
        _;
    }
    function distributeFund(address[]  memory  members_,uint256[] memory amounts_) public payable onlyOwner returns (bool[] memory) {
        uint dLen=members_.length;
        require(dLen==amounts_.length,"Sorry Miss matche distributions");
        require(msg.value>0,"Kindly Pay ETH");
        uint256 total=0;
        uint i=0;
        for(i=0;i<dLen;i++){ total+=amounts_[i];}
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        // (bool sent, bytes memory data) = address[i].call{value: msg.value}("");
        bool[] memory r_;
        for(i=0;i<dLen;i++){
            (r_[i],) = members_[i].call{value: amounts_[i]}("");
        }
        return(r_);
    } 
}