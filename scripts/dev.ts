import { ethers } from 'hardhat';

async function main() {
  const token = await ethers.deployContract('JimaoToken', [
    ethers.getBigInt('1000' + '00000000' + '000000'),
  ]);
  const a = await token.totalSupply();
  console.log(a);
}

main();
