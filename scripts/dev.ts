import { ethers } from 'hardhat';

async function main() {
  const signer = (await ethers.getSigners())[0];
  const jimao = await ethers.deployContract('JIMAO');

  await jimao.depositETH({ value: ethers.parseEther('0.1') });
  await jimao.depositETH({ value: ethers.parseEther('0.2') });
  await jimao.depositETH({ value: ethers.parseEther('0.3') });
  await jimao.depositETH({ value: ethers.parseEther('0.4') });
  await jimao.depositETH({ value: ethers.parseEther('0.5') });
  await jimao.depositETH({ value: ethers.parseEther('0.6') });
  await jimao.depositETH({ value: ethers.parseEther('0.7') });
  await jimao.depositETH({ value: ethers.parseEther('0.8') });
  await jimao.depositETH({ value: ethers.parseEther('0.9') });
  await jimao.depositETH({ value: ethers.parseEther('0.11') });
  await jimao.depositETH({ value: ethers.parseEther('0.22') });
  await jimao.depositETH({ value: ethers.parseEther('0.33') });

  const a = await jimao.myDeposits(2, 10);
  console.log(a);
}

main();
