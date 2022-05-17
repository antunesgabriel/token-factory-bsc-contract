// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Token.sol";

contract TokenFactory {
    uint256 public _totalTokenCreated;

    mapping(address => address) private _ownersToken;

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

        return newContractAddress;
    }
}
