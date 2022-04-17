require('dotenv').config();
module.exports = {
  networks: {
    development: {
     host: process.env.TRUFFLE_DEV_HOST,
     port: process.env.TRUFFLE_DEV_PORT,
     network_id: process.env.TRUFFLE_DEV_NETWORK_ID,
    },
  },
  compilers: {
    solc: {
      version: "0.8.13",
      optimizer: {
        enabled: true,
        runs: 200
      },
    }
  },
  contracts_directory: './src/contracts',
  contracts_build_directory: './src/abis',
};
