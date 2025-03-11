import boto3
import os


def handler(event, context):
    try:
        table_name = os.environ["TABLE_NAME"]
    except Exception as e:
        print("dynamodb TABLE_NAME env var should be defined in stack")
        raise e

    dynamodb = boto3.client("dynamodb")
    for record in event["Records"]:
        db_item = {
            "id": {"S": record["messageId"]},
            "timestamp": {"N": record["attributes"]["SentTimestamp"]},
            "eventSourceARN": {"S": record["eventSourceARN"]},
            "eventBody": {"S": record["body"]},
        }
        dynamodb.put_item(TableName=table_name, Item=db_item)

    response = {"statusCode": 200, "body": "success"}
    return response
