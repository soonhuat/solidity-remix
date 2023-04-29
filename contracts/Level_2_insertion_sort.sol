// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Level_2_Solution {
        
    function solution(uint256[10] memory array) external pure returns (uint256[10] memory) {
        insertionSort(array);
        return array;
    }

    function insertionSort(uint[10] memory data) internal pure {
        uint i = 0;
        uint j = 0;
        for (i = 1; i < 10; i++) {
            uint val = data[i];
            for (j = i; j >= 1 && val < data[j-1]; j--) {
                data[j] = data[j-1];
            }
            data[j] = val;
        }
    }
}