// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721.sol';

contract ERC721Enumerable is ERC721 {

    uint256[] private _allTokens;
    mapping(uint256 => uint256) private _allTokensIndex;
    mapping(address => uint256[]) private _ownedTokens;
    mapping(uint256 => uint256) private _ownedTokensIndex;


    function totalSupply() external view returns(uint256){
        return _allTokens.length;
    }

    function tokenByIndex(uint256 _index) external view returns(uint256){
        require(_index < _allTokens.length, 'Index out of range');
        return _allTokens[_index]; 
    } 

    function _mint(address to, uint256 tokenId) internal override(ERC721) {
        super._mint(to, tokenId);
        _addTokensToTotalSupply(tokenId);
        _ownedTokens[to].push(tokenId);
    }

    function _addTokensToTotalSupply(uint256 tokenId) private {
        _allTokens.push(tokenId);
    }
}