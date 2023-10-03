import { ethers } from 'hardhat';
import dayjs from 'dayjs';
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
  await jimao.depositETH(dayjs().add(10, 's').unix(), { value: ethers.parseEther('100') });
  await logBalance(signer);
  setTimeout(async () => {
    await jimao.changeDepositETH(0, ethers.parseEther('100'));
    await logBalance(signer);
    await jimao.changeDepositETH(0, ethers.parseEther('3'), { value: ethers.parseEther('3') });
    await logBalance(signer);
  }, 8000);
}

main();
