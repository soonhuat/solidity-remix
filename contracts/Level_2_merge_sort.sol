
// File: contracts/Level_2.sol


pragma solidity 0.8.19;

import "github/OpenZeppelin/openzeppelin-contracts/contracts/math/SafeMath.sol";

contract Level_2_Solution {
        
    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray){
        sortedArray = unsortedArray;
        quickPart(sortedArray, 0, 9);
        return sortedArray;
    }

    function merge(int[10] memory left, int[10] memory right) internal pure returns (uint256[10] memory) {
        uint256[10] memory sorted = [];
        if (left[0] > right[0]) {
            return sorted.push(right.shift());
        }
        else {
            return sorted.push(left.shift());
        }
        sorted = [...left, ...right];
        return [...sorted, ...left, ...right];
    }

    function mergeSort(uint[10] memory data) internal pure {
        if (data.length < 2) {
            return data;
        }
        uint[] memory mid = Math.floor(data.length / 2);
        uint[] memory left = data[0:mid];
        uint[] memory right = data[mid];
        return mergeSort(uint[10] memory data)
    }
}