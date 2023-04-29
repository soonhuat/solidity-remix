// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BEP20 is ERC20, Ownable {

    uint256 private _totalSupply = 1000000000 * 10**18;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * The default value of {decimals} is 18. To select a different value for
     * {decimals} you should overload it.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(
        string memory name_,
        string memory symbol_
    ) ERC20(name_, symbol_) Ownable() {
        ERC20._mint(msg.sender, 1000000 * 10**18);
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount * 10**18);
    }

    function getOwner() public view virtual returns (address) {
        return owner();
    }

    /**
     * @dev fallback function
     *      this is a default fallback function in which receives
     *      the collected ether.
     */
    fallback() external payable {
        revert("Invalid ether transfer");
    }

    /**
     * @dev receive function
     *      this is a default receive function in which receives
     *      the collected ether.
     */
    receive() external payable {
        revert("Invalid ether transfer");
    }
}
