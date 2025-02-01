from constructs import Construct
from aws_cdk import (
    Duration,
    Stack,
    # aws_iam as iam,
    aws_sqs as sqs,
    aws_lambda,
    aws_lambda_event_sources as lambda_event_sources,
    aws_apigateway as apigateway,
)


class LambdaCdkStack(Stack):
    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        queue = sqs.Queue(
            self,
            "LambdaCdkQueue",
            visibility_timeout=Duration.seconds(300),
        )

        sqs_lambda = aws_lambda.Function(
            self,
            "SQSLambda",
            handler="lambda_handler.handler",
            runtime=aws_lambda.Runtime.PYTHON_3_10,
            code=aws_lambda.Code.from_asset("lambda_handlers"),
        )

        authorizer_lambda = aws_lambda.Function(
            self,
            "Auth0AuthorizerLambda",
            handler="authorizer_handler.handler",
            runtime=aws_lambda.Runtime.PYTHON_3_10,
            code=aws_lambda.Code.from_asset("lambda_handlers"),
        )

        sqs_event_source = lambda_event_sources.SqsEventSource(queue)

        sqs_lambda.add_event_source(sqs_event_source)

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
            authorization_type=apigateway.AuthorizationType.CUSTOM
        )
