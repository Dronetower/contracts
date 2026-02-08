# contracts
HaaS
Here’s a very basic Ethereum-compatible smart contract written in Solidity representing a simple asset registry on a Blockchain-as-a-Service (HaaS) platform.
# BaaS + Cryptio Integration

This repository demonstrates a minimal Blockchain-as-a-Service
architecture integrated with Cryptio for accounting, audit,
and compliance workflows.

## Components
- Solidity smart contract emitting business events
- AWS Lambda for raw transaction capture
- DynamoDB for temporary persistence
- Cryptio platform for normalization and reporting

## Goal
Show how Cryptio becomes the system of record for blockchain activity
without custom accounting logic.


##Architecture

User / App
   |
   | 1. Smart Contract Interaction
   v
Ethereum / EVM Chain
   |
   | 2. Contract Events
   v
AWS Lambda (Node.js)
   |
   | 3. Store raw tx metadata
   v
Amazon DynamoDB
   |
   | 4. Wallet + Contract Address Sync
   v
Cryptio Platform (Demo Tenant)
   |
   | 5. Normalized Ledger / Reports
   v

   
Finance / Ops / Audit View

Key point for Cryptio:
