import { exitCode } from "process";
import * as dotenv from "dotenv";
import * as hre from "hardhat";
dotenv.config();

async function main() {
  console.log("Deploying Voting Contract...");
  const VotingContract = await hre.ethers.deployContract("Voting");
  const txn = await VotingContract.deploymentTransaction()?.wait();
  console.log(`Voting Contract deployed at address ${txn?.contractAddress}`);
}

main().catch((err) => {
  console.error(err);
  exitCode;
});
