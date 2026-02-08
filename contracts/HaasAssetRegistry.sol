// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BaasAssetRegistry {

    struct Asset {
        uint256 assetId;
        string assetType;
        address owner;
    }

    uint256 public assetCounter;

    event AssetCreated(
        uint256 indexed assetId,
        string assetType,
        address indexed owner
    );

    function createAsset(string calldata assetType) external {
        assetCounter++;
        emit AssetCreated(assetCounter, assetType, msg.sender);
    }
}
