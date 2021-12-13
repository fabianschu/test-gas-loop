require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: "0.8.4",
  networks: {
    hardhat: {
      saveDeployments: false,
      accounts: {
        count: 50,
      },
    },
  },
};
