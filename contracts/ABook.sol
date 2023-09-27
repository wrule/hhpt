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

  function LimitBuy(uint256 quota, uint256 base) public {

  }

  function LimitSell(uint256 base, uint256 quota) public {

  }

  function MarketBuy() public {

  }

  function MarketSell() public {

  }

  uint256[] list = new uint256[](20);

   modifier onlyOwner {
      require(msg.sender == address(this)); // 检查调用者是否为owner地址
      _; // 如果是的话，继续运行函数主体；否则报错并revert交易
   }

  function Push() public onlyOwner {
    // uint256[] memory pl = new uint256[](100);
    // pl.push();
    list.push();
  }

  function Length() public view returns (uint256) {
    return list.length;
  }
}
