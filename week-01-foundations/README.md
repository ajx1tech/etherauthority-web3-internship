# Blockchain Fundamentals & Ethereum Basics

## 1. Blockchain Architecture & Concepts
* **Distributed Ledger Technology (DLT):** A decentralized database synchronized across independent nodes without a central authority or single point of failure.
* **Block Anatomy:** Contains block header (previous block hash, timestamp, nonce, state root, difficulty) and transaction payload.
* **Cryptographic Hashing:**
  * **SHA-256 / Keccak-256:** Deterministic, collision-resistant, one-way mathematical functions used to secure block integrity and address generation.
* **Merkle Trees:** Binary tree of cryptographic hashes enabling efficient and secure verification of large datasets ($O(\log n)$ proof verification).
* **Consensus Mechanisms:**
  * **Proof of Work (PoW):** Computational resource-heavy puzzle solving to propose blocks (e.g., legacy Bitcoin).
  * **Proof of Stake (PoS):** Validators stake native tokens to propose and attest to blocks, drastically reducing energy consumption.
  * **Proof of Authority (PoA) / Byzantine Fault Tolerance (PBFT):** Identity/reputation-driven consensus for enterprise or consortium networks.

---

## 2. Ethereum Virtual Machine (EVM) & Account Model
* **EVM Overview:** A Turing-complete state machine that executes bytecode, maintaining global state consistency across all network nodes.
* **Account Types:**
  * **Externally Owned Accounts (EOAs):** Controlled by private keys; initiate transactions.
  * **Contract Accounts:** Controlled by deployed smart contract bytecode; execute logic when triggered by transactions.
* **Gas Mechanics:**
  * **Gas Limit:** Maximum computational steps a user is willing to allocate for a transaction.
  * **Gas Price / Base Fee + Priority Tip (EIP-1559):** Fee structure incentivizing validators and regulating block inclusion.
* **RPC Providers & Web3 Connectivity:** 
  * JSON-RPC endpoints (Alchemy, Infura, QuickNode, SecureChainAI RPC) bridging user interfaces/wallets with blockchain nodes.
