// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721 {
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    mapping(uint256 => address) private _tokenOwner;
    mapping(address => uint256) private _ownerTokensCount;

    modifier validAdress(address to) {
        require(to != address(0), "invalid address");
        _;
    }

    modifier validToken(uint256 tokenId) {
        require(_tokenOwner[tokenId] == address(0), "token already minted");
        _;
    }

    function _mint(address to, uint256 tokenId)
        internal
        validAdress(to)
        validToken(tokenId)
    {
        _tokenOwner[tokenId] = to;
        _ownerTokensCount[to]++;

        // Log Transfer
        emit Transfer(address(0), to, tokenId);
    }
}
