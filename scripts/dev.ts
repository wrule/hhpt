import { ethers } from 'hardhat';

async function main() {
  const token = await ethers.deployContract('JimaoToken');
  const a = await token.totalSupply();
  console.log(a);
  const b = await token.decimals();
  console.log(b);
}

main();
