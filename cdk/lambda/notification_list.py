import boto3
import os
import json


def handler(event, context):
    try:
        table_name = os.environ["TABLE_NAME"]
    except Exception as e:
        print("dynamodb TABLE_NAME env var should be defined in stack")
        raise e

    dynamodb = boto3.client("dynamodb")
    response = dynamodb.scan(TableName=table_name)

    response = {"statusCode": 200, "body": json.dumps(response)}
    return response
