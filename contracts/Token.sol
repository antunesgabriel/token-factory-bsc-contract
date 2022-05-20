// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract Token is ERC20, ERC20Burnable, Ownable {
    address private _refOwner;

    constructor(
        uint256 tokenSupply,
        string memory tokenName,
        string memory tokenSymbol,
        address refOwner
    ) ERC20(tokenName, tokenSymbol) {
        _refOwner = refOwner;

        _mint(refOwner, tokenSupply * 10**decimals());

        console.log("Mint a new Token --->", address(this));
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _msgSender() internal view virtual override returns (address) {
        return _refOwner;
    }
}
