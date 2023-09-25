import { ethers } from 'hardhat';

async function main() {
  const signer = (await ethers.getSigners())[0];
  const token = await ethers.deployContract('JimaoToken');
  const a = await token.totalSupply();
  console.log(a);
  const b = await token.decimals();
  console.log(b);
  const tx = await token.airdrop();
  const tr = await tx.wait(2);
  console.log(tx);
  const c = await token.balanceOf(signer.address);
  console.log(c);
}

main();
