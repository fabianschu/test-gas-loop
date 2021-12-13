//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IVault {
    function getTokens() external view returns(address[] memory);
}