# Counter Smart Contract — Technical Documentation

## 1. Overview
The **Counter Smart Contract** is deployed on the **SecureChainAI (SCAI) Mainnet (Chain ID: 34)** to demonstrate persistent state management, arithmetic safety, and transaction lifecycle mechanics on the Ethereum Virtual Machine (EVM).

---

## 2. Core EVM & Solidity Concepts Covered

### A. Persistent State Storage (`Storage` Slot Allocation)
* `uint256 public count;` declares a 256-bit unsigned integer stored permanently in the contract's storage trie at **Slot 0**.
* Marking the variable `public` instructs the Solidity compiler to automatically generate a getter function (`count()`) in the ABI.

### B. State Mutability: Read (`SLOAD`) vs. Write (`SSTORE`)
| Operation | Function | EVM Opcode | Gas Cost | Execution Context |
| :--- | :--- | :--- | :--- | :--- |
| **Read** | `get()` / `count()` | `SLOAD` | **Free (0 Gas)** when called externally | Executed locally by the RPC node without broadcasting a transaction. |
| **Write** | `inc()`, `dec()`, `reset()` | `SSTORE` | **Costs SCAI Gas** | Broadcasts a signed transaction to the mempool; validators execute and update the global state root. |

### C. Arithmetic Underflow Protection & Custom Errors
* Since `count` is an unsigned integer (`uint256`), its minimum value is `0`.
* Prior to Solidity `0.8.0`, subtracting `1` from `0` caused an integer underflow, wrapping the value around to $2^{256} - 1$.
* Solidity `^0.8.0` includes built-in overflow/underflow checks (`Panic(0x11)`), and this contract explicitly implements a custom error `error CounterUnderflow()` inside `dec()` to save gas over traditional `require(count > 0, "string")` revert strings.

### D. Events & Logs (`LOG` Opcodes)
* `CountIncremented`, `CountDecremented`, and `CountReset` emit transaction logs stored in the block receipt.
* Using the `indexed` keyword on `address indexed caller` adds the sender's address to the Bloom filter topics, allowing React frontends and block explorers to filter transactions efficiently.

---

## 3. Deployment & Verification Details
* **Network:** SecureChainAI (SCAI) Mainnet
* **Chain ID:** 34
* **Compiler Version:** Solidity `^0.8.20`
* **Deployment Tool:** Remix IDE via Injected Provider (MetaMask)
* **Deployed Contract Address:** `[PASTE_YOUR_CONTRACT_ADDRESS_HERE]`

---

## 4. How to Reproduce & Test
1. Open [Remix IDE](https://remix.ethereum.org/) and load `Counter.sol`.
2. Compile with Solidity `0.8.20+`.
3. Switch MetaMask network to **SCAI Mainnet** (Chain ID `34`, Faucet: `https://faucet.securechain.ai`).
4. In Remix **Deploy & Run Transactions**, select **Injected Provider - MetaMask** and click **Deploy**.
5. Call `inc()` and approve the MetaMask transaction, then call `get()` to verify the state updated to `1`.
