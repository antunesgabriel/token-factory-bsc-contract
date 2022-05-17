// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Token.sol";
import "hardhat/console.sol";

contract TokenFactory {
    uint256 public _totalTokenCreated;

    mapping(address => address) private _ownersToken;

    event NewToken(address indexed generateBy, address indexed contractAddress);

    function generateToken(
        string memory tokenName,
        string memory tokenSymbol,
        uint256 tokenSupply
    ) public returns (address) {
        address newContractAddress = address(
            new Token(tokenSupply, tokenName, tokenSymbol, msg.sender)
        );

        _ownersToken[msg.sender] = newContractAddress;
        _totalTokenCreated += 1;

        emit NewToken(msg.sender, newContractAddress);

        return newContractAddress;
    }
}
