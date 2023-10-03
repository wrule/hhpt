import { ethers } from 'hardhat';

async function main() {
  const signer = (await ethers.getSigners())[0];
  const jimao = await ethers.deployContract('JIMAO');
  const a = await jimao.myDeposits(1, 10);
  console.log(a);
}

main();
