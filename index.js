// Import the AWS SDK so we can talk to DynamoDB
const AWS = require("aws-sdk");

// Create a DynamoDB client
const dynamo = new AWS.DynamoDB.DocumentClient();

/**
 * Lambda handler
 * This function receives blockchain event data
 * and stores it in DynamoDB
 */
exports.handler = async (event) => {

  // Build a clean, predictable record structure
  // This makes downstream systems easier to integrate
  const record = {
    txHash: event.txHash,            // Blockchain transaction hash
    blockNumber: event.blockNumber,  // Block number
    wallet: event.wallet,            // Wallet that triggered the event
    assetId: event.assetId,          // Asset ID from the contract
    assetType: event.assetType,      // Asset type string
    timestamp: Date.now()             // When we processed it
  };

  // Write the record to DynamoDB
  await dynamo.put({
    TableName: process.env.TABLE_NAME, // Table name from env vars
    Item: record
  }).promise();

  // Return a success response
  return {
    statusCode: 200,
    body: "Event stored successfully"
  };
};
