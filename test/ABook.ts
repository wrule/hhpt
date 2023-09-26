import { expect } from 'chai';
import { ethers } from 'hardhat';

describe("ABook", function () {
  it("name", async function () {
    const jimao = await ethers.deployContract('JIMAO');
    const usdt = await ethers.deployContract('USDT');
    expect(1).to.equal(1);
  });
});
