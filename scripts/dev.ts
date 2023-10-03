import { ethers } from 'hardhat';
import { HardhatEthersSigner } from '@nomicfoundation/hardhat-ethers/signers';

async function logBalance(signer: HardhatEthersSigner) {
  const balance = await signer.provider.getBalance(signer.address);
  console.log(ethers.formatEther(balance) + 'ETH');
}

async function main() {
  const signer = (await ethers.getSigners())[0];
  await logBalance(signer);
  const jimao = await ethers.deployContract('JIMAO');
  await logBalance(signer);
  await jimao.depositETH({ value: ethers.parseEther('10') });
  await logBalance(signer);
  await jimao.changeDepositETH(0, ethers.parseEther('1'));
  await logBalance(signer);
}

main();
