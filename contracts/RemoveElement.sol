// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * @title Score
 * @dev Store & retrieve value in a variable
 */
contract RemoveElement {
    uint256[] arr;

    constructor() {
        arr = [0,1,3,4,5,6,9,10,11];
    }

    function deleteAtIindex(uint index) public {
        // Move the last element to the position to be deleted
        arr[index] = arr[arr.length - 1];

        // Remove the last element
        arr.pop();
    }

    function deleteItem(uint[] storage arr, uint index) internal {
        // Move the last element to the position to be deleted
        arr[index] = arr[arr.length - 1];

        // Remove the last element
        arr.pop();
    }
}
