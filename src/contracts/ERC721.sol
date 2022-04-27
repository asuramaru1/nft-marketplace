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

    function balanceOf(address _owner) validAdress(_owner) public view returns(uint256) {
        return _ownerTokensCount[_owner];
    }

    function ownerOf(uint256 _tokenId) external view returns(address) {
        address tokenOwner = _tokenOwner[_tokenId];
        require(tokenOwner != address(0), 'invalid token ID');
        return tokenOwner;
    }

    function _exists(uint256 tokenId) internal view returns(bool){
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId)
        internal
        virtual
        validAdress(to)
        validToken(tokenId)
    {
        _tokenOwner[tokenId] = to;
        _ownerTokensCount[to]++;

        // Log Transfer
        emit Transfer(address(0), to, tokenId);
    }
}
