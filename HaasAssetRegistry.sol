// SPDX-License-Identifier: MIT
// This line declares the license type for the contract.
// It is required by most tooling (Hardhat, Remix, GitHub scanning).

pragma solidity ^0.8.19;
// This specifies the Solidity compiler version.
// ^0.8.19 means "use 0.8.19 or any newer 0.8.x version"

/// @title BaasAssetRegistry
/// @notice A simple contract that emits events when assets are created
/// @dev This contract is intentionally simple for demo and accounting purposes
contract BaasAssetRegistry {

    // A struct groups related data together
    // Think of it like a simple database row
    struct Asset {
        uint256 assetId;   // Unique ID for the asset
        string assetType;  // Human-readable type (e.g. "bridge-token", "invoice")
        address owner;     // Wallet that created/owns the asset
    }

    // Counter used to generate unique asset IDs
    uint256 public assetCounter;

    // Events are logs written to the blockchain
    // Cryptio reads these events to understand business activity
    event AssetCreated(
        uint256 indexed assetId,     // indexed = easier to search
        string assetType,
        address indexed owner
    );

    /// @notice Creates a new asset and emits an event
    /// @param assetType A short description of the asset
    function createAsset(string calldata assetType) external {
        // Increment the counter so each asset has a unique ID
        assetCounter++;

        // Emit the event instead of storing complex state
        // This is cheaper, simpler, and accounting-friendly
        emit AssetCreated(
            assetCounter,
            assetType,
            msg.sender   // msg.sender is the wallet calling the function
        );
    }
}
