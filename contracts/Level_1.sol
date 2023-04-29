pragma solidity 0.8.19;

contract Level_1_Solution {
    function solution(
        uint256[2][2] calldata x, 
        uint256[2][2] calldata y
    ) external pure returns (
        uint256[2][2] memory fa
    ) {
        fa[0][0] = x[0][0] + y[0][0];
        fa[0][1] = x[0][1] + y[0][1];
        fa[1][0] = x[1][0] + y[1][0];
        fa[1][1] = x[1][1] + y[1][1];
        return fa;
    }
}