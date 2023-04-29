// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Storage {

    uint256 number;
    address public lastTriggerBy;

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }

    /**
     * @dev Store value in variable
     */
    function trigger() public {
        lastTriggerBy = msg.sender;
    }

    /**
     * @dev Return value 
     * @return value of 'address'
     */
    function lastTrigger() public view returns (address){
        return lastTriggerBy;
    }
}