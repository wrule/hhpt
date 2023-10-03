// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

struct Deposit {
  bool isValid;
  uint256 amount;
  int64 withdrawTime;
  address contractAddress;
}

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

  mapping(address => Deposit[]) public db;

  function depositETH() external payable {
    require(msg.value > 0, 'error');
    Deposit memory newDeposit;
    newDeposit.isValid = true;
    newDeposit.amount = msg.value;
    newDeposit.withdrawTime = 0;
    newDeposit.contractAddress = address(0);
    db[msg.sender].push(newDeposit);
  }

  function myDeposits(
    uint pageNum,
    uint pageSize
  ) view external returns (Deposit[] memory) {
    Deposit[] memory deposits = db[msg.sender];
    uint total = deposits.length;
    uint lastPageNum = total == 0 ? 1 : total / pageSize + (total % pageSize == 0 ? 0 : 1);
    if (pageNum > lastPageNum) pageNum = lastPageNum;
    uint startIndex = (pageNum - 1) * pageSize;
    uint endIndex = startIndex + pageSize;
    if (endIndex > total) endIndex = total;
    Deposit[] memory result = new Deposit[](endIndex - startIndex);
    for (uint i = startIndex; i < endIndex; ++i) {
      result[i - startIndex] = deposits[i];
    }
    return result;
  }
}
