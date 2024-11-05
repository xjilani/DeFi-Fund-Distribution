// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract MyToken is ERC721,ERC721URIStorage, Ownable {
    mapping(uint256=>bytes) tokenData;
    constructor() ERC721("VritaVentures", "VritaNFT")  Ownable(msg.sender) {}
    function mint0(address to_, uint256 tokenId_,string memory uri_,bytes memory data_) public payable onlyOwner   {
        _safeMint(to_, tokenId_,data_);
        _setTokenURI(tokenId_,uri_);
        tokenData[tokenId_]=data_;
    }
    function mintNFT(uint256 tokenId_,string memory uri_,bytes memory data_) public payable    {
        _safeMint(msg.sender, tokenId_,data_);
        _setTokenURI(tokenId_,uri_);
        tokenData[tokenId_]=data_;
    }
    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory){
        return super.tokenURI(tokenId);
    }
    function getData(uint256 tokenId_) public view returns(bytes memory){
        /*
        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = _baseURI();
        if (bytes(_tokenURI).length > 0) {
            return string.concat(base, _tokenURI);
        }
        */
        return(tokenData[tokenId_]);
    }
    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
