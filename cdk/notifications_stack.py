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
    Aws as AWS,
)


class NotificationsStack(Stack):
    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        # Our queue for handling incoming notifications
        incoming_notification_queue = sqs.Queue(
            self,
            "LambdaCdkQueue",
            visibility_timeout=Duration.seconds(300),
        )

        api_gateway_role = iam.Role(
            self,
            "RestAPIRole",
            assumed_by=iam.ServicePrincipal("apigateway.amazonaws.com"),
            managed_policies=[
                iam.ManagedPolicy.from_aws_managed_policy_name("AmazonSQSFullAccess")
            ],
        )
        api_gateway_base = apigateway.RestApi(self, "ApiGateway")
        api_notifications_resource = api_gateway_base.root.add_resource("notifications")

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

        # Add the API GW Integration to the "example" API GW Resource
        api_notifications_resource.add_method(
            "POST", api_notifications_sqs_integation, method_responses=[method_response]
        )

        sqs_lambda = aws_lambda.Function(
            self,
            "SQSLambda",
            handler="notification_handler.handler",
            runtime=aws_lambda.Runtime.PYTHON_3_13,
            code=aws_lambda.Code.from_asset("./cdk/lambda"),
        )

        sqs_event_source = lambda_event_sources.SqsEventSource(
            incoming_notification_queue
        )

        sqs_lambda.add_event_source(sqs_event_source)

        notification_table = dynamodb.Table(
            self,
            "NotificationsTable",
            partition_key=dynamodb.Attribute(
                name="id", type=dynamodb.AttributeType.STRING
            ),
            sort_key=dynamodb.Attribute(
                name="timestamp", type=dynamodb.AttributeType.STRING
            ),
            table_name="NoticationsTable",
        )
        sqs_lambda.add_environment("TABLE_NAME", notification_table.table_name)
        notification_table.grant_write_data(sqs_lambda)

        #######################################################################
        # Authorization code from here on
        #######################################################################

        authorizer_lambda = aws_lambda.Function(
            self,
            "Auth0AuthorizerLambda",
            handler="authorizer_handler.handler",
            runtime=aws_lambda.Runtime.PYTHON_3_13,
            code=aws_lambda.Code.from_asset("./cdk/lambda"),
        )

        api_gateway_authorizer = apigateway.TokenAuthorizer(
            self,
            "Auth0ApiGatewayAuthorizer",
            handler=authorizer_lambda,
        )

        api_gateway = apigateway.LambdaRestApi(
            self, "HelloWorldApi", handler=sqs_lambda, proxy=False
        )

        hello_resource = api_gateway.root.add_resource("hello")
        hello_resource.add_method(
            "POST",
            authorizer=api_gateway_authorizer,
            authorization_type=apigateway.AuthorizationType.CUSTOM,
        )
