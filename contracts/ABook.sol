// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ABook {
  ERC20 baseToken;
  ERC20 quotaToken;

  constructor(
    address baseAddr,
    address quoteAddr
  ) {
    baseToken = ERC20(baseAddr);
    quotaToken = ERC20(quoteAddr);
  }

  function symbol() public view returns (string memory) {
    return string(abi.encodePacked(baseToken.symbol(), "/", quotaToken.symbol()));
  }

  function LimitBuy() public {

  }

  function LimitSell() public {

  }

  function MarketBuy() public {

  }

  function MarketSell() public {

  }
}
