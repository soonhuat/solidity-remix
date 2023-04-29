// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * @title Score
 * @dev Store & retrieve value in a variable
 */
contract Score {
    uint256 score;
    address owner;

    mapping(address => uint256) scoreTable;

    event ScoreSet(uint256 indexed);

    modifier onlyOwner {
        require (msg.sender == owner, "not allow");
        _;
    }

    constructor() {
        owner = msg.sender;
        score = 5;
    }

    function getScore() public view returns (uint256) {
        return score;
    }

    function setScore(uint256 _newScore) public onlyOwner {
        score = _newScore;
        emit ScoreSet(_newScore);
    }

    function setOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}
