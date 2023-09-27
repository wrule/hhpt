// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract JIMAO is ERC20, Ownable {
  constructor() ERC20("Jimao Token", "JIMAO") {
    _mint(address(this), 1e3 * 1e8 * 1e10);
  }

  function decimals() public pure override returns (uint8) {
    return 10;
  }

  function airdrop() external onlyOwner {
    _transfer(address(this), msg.sender, 1e6 * 1e10);
  }
}
