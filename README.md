# Token Exchange

A learning project in Solidity where two ERC20 tokens, `HotToken` and `ColdToken`, are implemented along with a contract for exchanging these tokens and purchasing them with Ether.

## Description

This project demonstrates the creation of two ERC20 tokens and a contract for exchanging them. Users can exchange `HotToken` for `ColdToken` and vice versa, as well as purchase them with Ether. The contracts include necessary checks to ensure the security and correctness of the operations.

## Key Features

1. **Token Exchange**: Users can exchange `HotToken` for `ColdToken` and vice versa. To do so, they must first transfer the corresponding token to the contract's address or purchase it with Ether.
2. **Secure Transfer**: Users' tokens cannot be "lost" during transfer. `require` checks are used to ensure transaction validity.
3. **Exchange with Approval**: Another user, given approval, can exchange tokens within a set limit. The contract includes checks to ensure this condition is met.
