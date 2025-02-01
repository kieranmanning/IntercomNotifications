def handler(event, context):
    print(event)
    response = {"statusCode": 200, "body": "success"}
    return response
