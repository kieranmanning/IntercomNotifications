import json
import boto3
import os

def handler(event, context):
    event_data = json.loads(event)

    try:
        table_name = os.environ["TABLE_NAME"]
    except Exception as e:
        print("dynamodb TABLE_NAME env var should be defined in stack")
        raise e

    dynamodb = boto3.client("dynamodb")
    dynamodb.put_item(
        table_name=table_name,
        item=event_data)

    response = {"statusCode": 200, "body": "success"}
    return response