from constructs import Construct
from aws_cdk import (
    Duration,
    Stack,
    aws_iam as iam,
    aws_sqs as sqs,
    aws_lambda,
    aws_lambda_event_sources as lambda_event_sources,
    aws_dynamodb as dynamodb,
    aws_apigateway as apigateway,
    aws_cognito as cognito,
    Aws as AWS,
    RemovalPolicy,
)


class NotificationsStack(Stack):
    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        # Our queue for handling incoming notifications
        incoming_notification_queue = sqs.Queue(
            self,
            "NotificationQueue",
            visibility_timeout=Duration.seconds(300),
        )

        global_user_pool = cognito.UserPool.from_user_pool_id(
            self,
            "GlobalUserPool",
            user_pool_id="eu-west-1_xaqjPOYjC",
        )

        cognito_authorizer = apigateway.CognitoUserPoolsAuthorizer(
            self,
            "CognitoAuthorizer",
            cognito_user_pools=[global_user_pool],
            authorizer_name="CognitoAuthorizer",
            identity_source="method.request.header.Authorization",
        )

        api_gateway_role = iam.Role(
            self,
            "RestAPIRole",
            assumed_by=iam.ServicePrincipal("apigateway.amazonaws.com"),
            managed_policies=[
                iam.ManagedPolicy.from_aws_managed_policy_name("AmazonSQSFullAccess")
            ],
        )
        notifications_api_gateway_base = apigateway.RestApi(self, "NotificationsApi")

        # Create our SQS integration
        sqs_integration_response = apigateway.IntegrationResponse(
            status_code="200",
            response_templates={"application/json": ""},
        )

        api_sqs_integration_options = apigateway.IntegrationOptions(
            credentials_role=api_gateway_role,
            request_templates={
                "application/json": "Action=SendMessage&MessageBody=$input.body"
            },
            passthrough_behavior=apigateway.PassthroughBehavior.NEVER,
            request_parameters={
                "integration.request.header.Content-Type": "'application/x-www-form-urlencoded'"
            },
            integration_responses=[sqs_integration_response],
        )

        api_notifications_sqs_integation = apigateway.AwsIntegration(
            service="sqs",
            integration_http_method="POST",
            path="{}/{}".format(AWS.ACCOUNT_ID, incoming_notification_queue.queue_name),
            options=api_sqs_integration_options,
        )

        method_response = apigateway.MethodResponse(status_code="200")

        api_notifications_resource = notifications_api_gateway_base.root.add_resource(
            "notifications"
        )
        api_notifications_resource.add_method(
            "POST",
            api_notifications_sqs_integation,
            method_responses=[method_response],
            authorizer=cognito_authorizer,
            authorization_type=apigateway.AuthorizationType.COGNITO,
        )

        notification_create_handler = aws_lambda.Function(
            self,
            "NotificationHandler",
            handler="notification_update.handler",
            runtime=aws_lambda.Runtime.PYTHON_3_13,
            code=aws_lambda.Code.from_asset("./cdk/lambda"),
        )

        sqs_event_source = lambda_event_sources.SqsEventSource(
            incoming_notification_queue
        )

        notification_create_handler.add_event_source(sqs_event_source)

        notification_table = dynamodb.Table(
            self,
            "NotificationsTable",
            partition_key=dynamodb.Attribute(
                name="id", type=dynamodb.AttributeType.STRING
            ),
            sort_key=dynamodb.Attribute(
                name="timestamp", type=dynamodb.AttributeType.NUMBER
            ),
            table_name="NotificationsTable",
            removal_policy=RemovalPolicy.DESTROY,
        )
        notification_create_handler.add_environment(
            "TABLE_NAME", notification_table.table_name
        )
        notification_table.grant_write_data(notification_create_handler)

        notification_list_handler = aws_lambda.Function(
            self,
            "NotificationListHandler",
            handler="notification_list.handler",
            runtime=aws_lambda.Runtime.PYTHON_3_13,
            code=aws_lambda.Code.from_asset("./cdk/lambda"),
        )
        notification_list_handler.add_environment(
            "TABLE_NAME", notification_table.table_name
        )
        notification_table.grant_read_data(notification_list_handler)

        api_notifications_resource.add_method(
            "GET",
            apigateway.LambdaIntegration(notification_list_handler),
            authorizer=cognito_authorizer,
            authorization_type=apigateway.AuthorizationType.COGNITO,
        )
