// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract USDT is ERC20 {
  constructor() ERC20("USDT", "USDT") {
    _mint(address(this), 1e3 * 1e8 * 1e6);
  }

  function decimals() public pure override returns (uint8) {
    return 6;
  }

  function airdrop() external {
    _transfer(address(this), msg.sender, 10 * 1e6);
  }
}
