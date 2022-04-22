// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ERC721Connector.sol";

contract CryptoXutie is ERC721Connector {
    string[] public cryptoXuties;

    mapping(string => bool) _cryptoXutieExists;

    function mint(string memory _cryptoXutie) public {
        require(!_cryptoXutieExists[_cryptoXutie], "CryptoXutie Already Exists");
        cryptoXuties.push(_cryptoXutie);
        _mint(msg.sender, cryptoXuties.length - 1);
        _cryptoXutieExists[_cryptoXutie] = true;
    }

    constructor() ERC721Connector("CryptoXutie", "CXUTIEZ") {}
}
