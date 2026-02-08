const AWS = require("aws-sdk");
const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
  const record = {
    txHash: event.txHash,
    blockNumber: event.blockNumber,
    wallet: event.wallet,
    assetId: event.assetId,
    assetType: event.assetType,
    timestamp: Date.now()
  };

  await dynamo.put({
    TableName: process.env.TABLE_NAME,
    Item: record
  }).promise();

  return { statusCode: 200 };
};
