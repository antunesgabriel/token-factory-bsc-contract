import { ethers } from "hardhat";

async function main() {
  const [owner, randomPerson] = await ethers.getSigners();

  const TokenFactory = await ethers.getContractFactory("TokenFactory");
  const tokenFactory = await TokenFactory.deploy();

  await tokenFactory.deployed();

  console.log("TokenFactory deployed to:", tokenFactory.address);

  const address = await tokenFactory.generateToken(
    "Fake Token",
    "FKTN",
    1000000
  );

  const firstContractAddress = ethers.utils.getContractAddress(address);

  console.log(`\nOwner -> ${owner.address}:`, firstContractAddress);

  const address2 = await tokenFactory
    .connect(randomPerson)
    .generateToken("Fake Token 2", "FKTN2", 100);

  const secondContractAddress = ethers.utils.getContractAddress(address2);

  console.log(`\nOwner -> ${randomPerson.address}:`, secondContractAddress);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
