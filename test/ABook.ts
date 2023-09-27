import { expect } from 'chai';
import { ethers } from 'hardhat';

describe("ABook", function () {
  it("name", async function () {
    const [jimao, usdt] = await Promise.all([
      ethers.deployContract('JIMAO'),
      ethers.deployContract('USDT'),
    ]);
    const abook = await ethers.deployContract('ABook', await Promise.all([
      jimao.getAddress(),
      usdt.getAddress(),
    ]));
    console.log(await abook.symbol());
    const a = await abook.Push();
    const b = await abook.Length();
    console.log(b);
    expect(1).to.equal(1);
  });
});
