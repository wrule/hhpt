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

struct Pagination {
  uint total;
  uint pageNum;
  uint pageSize;
  Deposit[] list;
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
    require(msg.value > 0, "msg.value > 0");
    Deposit memory newDeposit;
    newDeposit.isValid = true;
    newDeposit.amount = msg.value;
    newDeposit.withdrawTime = 0;
    newDeposit.contractAddress = address(0);
    db[msg.sender].push(newDeposit);
  }

  function changeDepositETH(uint index, uint withdrawAmount) external payable {
    require(index < db[msg.sender].length, "index < db[msg.sender].length");
    Deposit storage deposit = db[msg.sender][index];
    deposit.amount += msg.value;
    require(deposit.amount >= withdrawAmount, "deposit.amount >= withdrawAmount");
    require(address(this).balance >= withdrawAmount, "address(this).balance >= withdrawAmount");
    deposit.amount -= withdrawAmount;
    payable(msg.sender).transfer(withdrawAmount);
  }

  function myDeposits(
    uint pageNum,
    uint pageSize
  ) view external returns (Pagination memory) {
    require(pageNum >= 1, "pageNum must >= 1");
    require(pageSize >= 1, "pageSize must >= 1");
    Deposit[] memory deposits = db[msg.sender];
    uint total = deposits.length;
    uint lastPageNum = total == 0 ? 1 : total / pageSize + (total % pageSize == 0 ? 0 : 1);
    if (pageNum > lastPageNum) pageNum = lastPageNum;
    uint startIndex = (pageNum - 1) * pageSize;
    uint endIndex = startIndex + pageSize;
    if (endIndex > total) endIndex = total;
    Deposit[] memory list = new Deposit[](endIndex - startIndex);
    for (uint i = startIndex; i < endIndex; ++i) {
      list[i - startIndex] = deposits[i];
    }
    Pagination memory result;
    result.total = total;
    result.pageNum = pageNum;
    result.pageSize = pageSize;
    result.list = list;
    return result;
  }
}
