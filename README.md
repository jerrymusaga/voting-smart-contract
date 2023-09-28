# Voting Smart Contract deployed on SwissTronik EVM Testnet
This is a basic smart contract for a voting system that allows only registered members to vote and it is deployed on Swisstronik testnet. Only contract owner can register new voters and only registered voters can interact with the contract. Registered voters will be able to cast their votes.

# [Transaction Hash to deployed contract address](https://explorer-evm.testnet.swisstronik.com/address/0x86498F56A6567105Df334CcB3B4F7fE88dFED39d)

## Contract Address: 0x86498F56A6567105Df334CcB3B4F7fE88dFED39d

# Run project locally after cloning the repo 
```
yarn hardhat compile
yarn hardhat run --network swisstronik ./scripts/Voting.ts
```
