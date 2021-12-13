const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Loop", function () {
  let loopInstance, vaultInstance, addresses;

  beforeEach(async () => {
    const signers = await ethers.getSigners();
    addresses = signers.map(({ address }) => address);
    const loopFactory = await ethers.getContractFactory("Loop");
    const vaultFactory = await ethers.getContractFactory("Vault");
    vaultInstance = await vaultFactory.deploy(addresses);
    loopInstance = await loopFactory.deploy(vaultInstance.address);
  });

  it("returns the missing address", async function () {
    const missingAddresses = await loopInstance.findMissing(
      addresses.slice(0, -2)
    );
    expect(missingAddresses).to.eql(
      [
        addresses[addresses.length - 1],
        addresses[addresses.length - 2],
      ].reverse()
    );
  });

  it("cost little gas", async function () {
    const estimation = await loopInstance.estimateGas.findMissing(
      addresses.slice(0, -1)
    );

    expect(estimation.toNumber()).to.be.lessThan(500_000);
  });
});
