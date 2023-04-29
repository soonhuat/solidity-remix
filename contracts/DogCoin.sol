// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

/**
 * @title Score
 * @dev Store & retrieve value in a variable
 */
contract DogCoin {
    uint256 totalSupply;
    address owner;

    struct Payment {
        address amount;
        uint256 recipient;
    }

    mapping(address => uint256) balances;
    mapping(address => Payment[]) payments;

    event TotalSupplyChanged(uint256 indexed);
    event Transferred(address indexed to, uint256 indexed amount);

    modifier onlyOwner {
        require (msg.sender == owner, "not allow");
        _;
    }

    constructor() {
        owner = msg.sender;
        totalSupply = 2000000 * 10^18;
        balances[owner] = 2000000 * 10^18;
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function getPayments(address wallet) public view returns (Payment[] memory) {
        return payments[wallet];
    }

    function increaseThousandSupply() external onlyOwner {
        totalSupply += 1000* 10^18;
        emit TotalSupplyChanged(totalSupply);
    }

    function transfer(address to, uint256 amount) external {
        require(amount > 0, "You cannot transfer 0 amount.");
        require(balances[msg.sender] >= amount, "You don't have enough balance to transfer.");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transferred(to, amount);
    }

    function setOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}
