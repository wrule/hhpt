import { expect } from 'chai';
import { ethers } from 'hardhat';

describe("Wtf", function () {
  it("Text", async function () {
    const wtf = await ethers.deployContract('Wtf');
    expect(await wtf._text()).to.equal('Hello Web3!');
  });
});
