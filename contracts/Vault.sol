//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Vault {
    address[] private _addresses;

    constructor(address[] memory addresses) {
        for (uint8 i = 0; i < addresses.length; i ++) {
            _addresses.push(addresses[i]);
        }
    }

    function getTokens() public view returns (address[] memory tokenAddresses) {
        tokenAddresses = new address[](_addresses.length);
        for(uint8 i = 0; i < _addresses.length; i++) {
            tokenAddresses[i] = _addresses[i];
        }
    }
}