import { ethers } from 'hardhat';

async function main() {
  console.log(process.argv);
  const name = 'JIMAO';
  const signer = (await ethers.getSigners())[0];
  console.log('operator:', signer.address);
  console.log(`deploy contract ${name}...`);
  const contract = await ethers.deployContract(name);
  console.log('wait for deployment...');
  await contract.waitForDeployment();
  console.log('contract address:', contract.target);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
