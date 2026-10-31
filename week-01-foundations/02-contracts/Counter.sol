// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Counter Smart Contract
 * @author Ajit Sharma (ajx1tech)
 * @notice A foundational smart contract demonstrating EVM state storage, 
 *         read vs. write gas mechanics, and event emission on SecureChainAI (SCAI).
 */
contract Counter {
    // State variable stored permanently in EVM contract storage (Slot 0)
    uint256 public count;

    // Events allow off-chain DApps (like React frontends) to listen to state changes
    event CountIncremented(address indexed caller, uint256 newCount);
    event CountDecremented(address indexed caller, uint256 newCount);
    event CountReset(address indexed caller);

    // Custom error for gas-efficient revert handling
    error CounterUnderflow();

    /**
     * @notice Reads the current counter value
     * @dev Marked 'view' because it only reads state (SLOAD) without modifying it.
     *      External calls to this function via RPC are free (0 gas).
     */
    function get() public view returns (uint256) {
        return count;
    }

    /**
     * @notice Increments the counter by 1
     * @dev Modifies state (SSTORE), requiring a signed transaction and SCAI gas fees.
     */
    function inc() public {
        count += 1;
        emit CountIncremented(msg.sender, count);
    }

    /**
     * @notice Decrements the counter by 1
     * @dev Reverts if count is already 0 to prevent arithmetic underflow.
     */
    function dec() public {
        if (count == 0) {
            revert CounterUnderflow();
        }
        count -= 1;
        emit CountDecremented(msg.sender, count);
    }

    /**
     * @notice Resets the counter back to 0
     */
    function reset() public {
        count = 0;
        emit CountReset(msg.sender);
    }
}
