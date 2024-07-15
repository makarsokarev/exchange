# Token Exchange

A learning project in Solidity where two ERC20 tokens, `HotToken` and `ColdToken`, are implemented along with a contract for exchanging these tokens and purchasing them with Ether.

## Description

This project demonstrates the creation of two ERC20 tokens and a contract for exchanging them. Users can exchange `HotToken` for `ColdToken` and vice versa, as well as purchase them with Ether. The contracts include necessary checks to ensure the security and correctness of the operations.

## Key Features

1. **Token Exchange**: Users can exchange `HotToken` for `ColdToken` and vice versa. To do so, they must first transfer the corresponding token to the contract's address or purchase it with Ether.
2. **Secure Transfer**: Users' tokens cannot be "lost" during transfer. `require` checks are used to ensure transaction validity.
3. **Exchange with Approval**: Another user, given approval, can exchange tokens within a set limit. The contract includes checks to ensure this condition is met.

## Token and Exchange Deployment Workflow

This guide outlines the steps to deploy and interact with the COLD and HOT tokens and the Exchange contract.

### Deployment

1. **Deploy COLD Token**
    - `initialSupply`: 10
    - `_tokenPrice`: 1000000000000000000 (1 ether)

2. **Deploy HOT Token**
    - `initialSupply`: 10
    - `_tokenPrice`: 1000000000000000000 (1 ether)

3. **Deploy Exchange Contract**
    - `_tokenCOLD`: Address of the deployed COLD token
    - `_tokenHOT`: Address of the deployed HOT token

### Token Purchase

4. **Buy COLD Tokens**
    - Call `buyTokens` function of the `COLDToken` contract from your wallet.
    - `numberOfTokens`: 2
    - `value`: 2 ether

5. **Buy HOT Tokens**
    - Call `buyTokens` function of the `HOTToken` contract from your wallet.
    - `numberOfTokens`: 2
    - `value`: 2 ether

### Token Transfer to Exchange

6. **Buy COLD Tokens for Exchange**
    - Call `buyTokensCOLD` function of the `Exchange` contract.
    - `amount`: 4
    - `value`: 4 ether

7. **Buy HOT Tokens for Exchange**
    - Call `buyTokensHOT` function of the `Exchange` contract.
    - `amount`: 4
    - `value`: 4 ether

At this point:
- Your wallet has: 2 COLD and 2 HOT tokens.
- The Exchange has: 4 COLD and 4 HOT tokens.

### Approving Token Spending

8. **Approve Exchange to Spend COLD Tokens**
    - Call `approve` function of the `COLDToken` contract from your wallet.
    - `spender`: Address of the Exchange contract
    - `amount`: 1

9. **Approve Exchange to Spend HOT Tokens**
    - Call `approve` function of the `HOTToken` contract from your wallet.
    - `spender`: Address of the Exchange contract
    - `amount`: 1

### Token Exchange

10. **Exchange COLD Tokens for HOT Tokens**
    - Call `exchangeCOLDToHOT` function of the `Exchange` contract.
    - `amount`: 1

### Verifying Balances

- Check the balance of COLD tokens in your wallet.
- Check the balance of COLD tokens in the Exchange contract.
