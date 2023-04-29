// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ShameCoin is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("Gold", "GLD")  {
        _mint(msg.sender, initialSupply);
    }

    function decimals() public view virtual override returns (uint8) {
        return 0;
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        if (msg.sender == owner()) {
            require(balanceOf(msg.sender) > 0, "You don't have token yet.");
            _transfer(msg.sender, to, 1);
        } else {
            _mint(msg.sender, 1);
        }
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * NOTE: Does not update the allowance if the current allowance
     * is the maximum `uint256`.
     *
     * Requirements:
     *
     * - `from` and `to` cannot be the zero address.
     * - `from` must have a balance of at least `amount`.
     * - the caller must have allowance for ``from``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool) {
        if (msg.sender != owner()) {
            _mint(msg.sender, 1);
        } else {
            require(balanceOf(from) > 0, "From address don't have token yet.");
            require(allowance(from, msg.sender) > 0, "Not yet give allowance.");
            _spendAllowance(from, spender, 1);
            _burn(from, 1);
        }
        return true;
    }
}