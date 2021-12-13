//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./IVault.sol";

contract Loop {
    IVault private _vault;

    constructor(address vault) {
        _vault = IVault(vault);
    }

    function findMissing(address[] memory addresses) public view returns (address[] memory onlyMissingAddresses) {
        address[] memory vaultAddresses = _vault.getTokens();
        address[] memory removedTokens = new address[](vaultAddresses.length);
        uint256 miaCount;

        for(uint8 i = 0; i < vaultAddresses.length; i++) {
            bool isMissing = true;
            
            for(uint8 j = 0; j < addresses.length; j++) {
                if (vaultAddresses[i] == addresses[j]) {
                    isMissing = false;
                    break;
                }
            }

            if (isMissing) {
                removedTokens[miaCount] = vaultAddresses[i];
                miaCount++;
            }
        }

        onlyMissingAddresses = new address[](miaCount);

        for (uint8 i = 0; i < miaCount; i++) {
            onlyMissingAddresses[i] = removedTokens[i];
        }
    }
}
