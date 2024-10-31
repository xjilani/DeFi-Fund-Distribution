//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
// import "@openzeppelin/contracts/access/Ownable.sol";
contract DeFiFundDistribution {
    address owner;
    constructor(address owner_){
        owner=owner_;
    }
    modifier  onlyOwner {
        require(msg.sender==owner,"Your are not authorized person");
        _;
    }
    function depositIntoContract() public payable {}
    
    function withdraw(address  to_) public{
        uint256 amount = address(this).balance;
        (bool success,) = to_.call{value: amount}("");
        require(success, "Failed to send ETH");
    }
    function eth()public view returns (uint256){
        return(address(this).balance);
    }
    function distributeFund(address[]  memory  members_,uint256[] memory amounts_) public payable onlyOwner  {
        uint dLen=members_.length;
        require(dLen==amounts_.length,"Sorry Miss matche distributions");
        require(msg.value>0,"Kindly Pay ETH");
        uint256 total=0;
        uint i=0;
        for(i=0;i<dLen;i++){ total=total+amounts_[i];}
        require(total==msg.value,"Invalid amount distribution");
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        //The gas cost will be deducted from the external account that initiated the transaction.
        // (bool sent, bytes memory data) = address[i].call{value: msg.value}("");
        bool status=false;
        for(i=0;i<dLen;i++){
            (status,) = members_[i].call{value: amounts_[i]}("");
            require(status==true,"Distribution faild");
        }
        
    } 
}