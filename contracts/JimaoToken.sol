// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract JimaoToken is ERC20 {
  constructor() ERC20("JimaoToken", "JMT") {
    _mint(address(this), 1e3 * 1e8 * 1e6);
  }

  function decimals() public pure virtual override returns (uint8) {
    return 6;
  }
}
