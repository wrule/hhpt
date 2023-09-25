import { expect } from 'chai';
import { ethers } from 'hardhat';

describe("JimaoToken", function () {
  it("Deploy", async function () {
    const token = await ethers.deployContract('JimaoToken', [
      ethers.getBigInt('1000' + '00000000' + '000000'),
    ]);
    const a = await token.totalSupply();
    console.log(a);
    expect(1).to.equal(1);
    // expect(await wtf._text()).to.equal('Hello Web3!');
  });
});
