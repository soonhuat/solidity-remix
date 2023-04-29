// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Level_2_Solution {
        
    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray){
        sortedArray = unsortedArray;
        quickPart(sortedArray, 0, 9);
        return sortedArray;
    }

    function quickPart(uint[10] memory data, uint low, uint high) internal pure {
        if (low < high) {
            uint pivotVal = data[(low + high) / 2];
        
            uint low1 = low;
            uint high1 = high;
            for (;;) {
                while (data[low1] < pivotVal) low1++;
                while (data[high1] > pivotVal) high1--;
                if (low1 >= high1) break;
                (data[low1], data[high1]) = (data[high1], data[low1]);
                low1++;
                high1--;
            }
            if (low < high1) quickPart(data, low, high1);
            high1++;
            if (high1 < high) quickPart(data, high1, high);
        }
    }
}