import { config as dotEnvConfig } from "dotenv";
dotEnvConfig();

import { HardhatUserConfig } from "hardhat/types";
import "@nomiclabs/hardhat-waffle";
import "@typechain/hardhat";
import "@nomiclabs/hardhat-etherscan";

const PRIVATE_KEY =process.env.PRIVATE_KEY
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;

const config: any = {
  solidity: "0.8.17",
  networks:{
      testnet:{
        url:"https://eth-sepolia.g.alchemy.com/v2/cb_rZmR500cF6qRkHuPCnK53kD7KXt1u",
        chainId:11155111,
        accounts: [PRIVATE_KEY]
      },

  }, 
   etherscan:{
      apiKey: ETHERSCAN_API_KEY,
   }
};
export default config;