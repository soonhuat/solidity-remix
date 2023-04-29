// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * @title Score
 * @dev Store & retrieve value in a variable
 */
contract Deployer {
    address deployer;
    address constant public defaultAddress = 0x000000000000000000000000000000000000dEaD;

    constructor() {
        deployer = msg.sender;
    }

    function checkMe() external view returns (address) {
        if (msg.sender == deployer) {
            return defaultAddress;
        }
        return deployer;
    }
}
