import { ethers } from "hardhat";

const main = async () => {
  const transactions = await ethers.deployContract("Transactions");

  await transactions.waitForDeployment();

  const address = await transactions.getAddress();

  console.log("Transactions deployed to:", address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();
