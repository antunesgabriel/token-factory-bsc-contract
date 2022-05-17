import { ethers } from "hardhat";

async function main() {
  const TokenFactory = await ethers.getContractFactory("TokenFactory");
  const tokenFactory = await TokenFactory.deploy();

  await tokenFactory.deployed();

  console.log("TokenFactory deployed to:", tokenFactory.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
