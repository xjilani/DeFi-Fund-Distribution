//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
// import "@openzeppelin/contracts/access/Ownable.sol";
contract Student12 {
    address owner;
    struct Student{
        string reg_no;
        string name;
        uint16 marks;
        uint16 full_marks;
        uint16 year;
    }
    mapping(string => Student) public records;
    constructor(address owner_){
        owner=owner_;
    }
    modifier  onlyOwner {
        require(msg.sender==owner,"Your are not authorized person");
        _;
    }
    //https://solidity-by-example.org/hello-world/
    function addRecord(string memory reg_no_,string memory name_,uint16 marks_,uint16 full_marks_,uint16 year_) public  onlyOwner {
        require(year_>=2010,"Invalid Year");
        require(bytes(name_).length>3,"Invalid Name");
        require(bytes(reg_no_).length>3,"Invalid Registration No");
        require(marks_>0,"Invalid Obtianed Marks");
        require(full_marks_>0 && marks_<=full_marks_,"Invalid Full Marks");
        require(records[reg_no_].year==0 ,"Already exist");
        records[reg_no_]=Student(reg_no_,name_,marks_,full_marks_,year_);
    }
    function getRecord(string memory reg_no_) public view returns(Student memory){
        return(records[reg_no_]);
    }
    
}