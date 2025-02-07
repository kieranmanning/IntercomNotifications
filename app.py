#!/usr/bin/env python3

import aws_cdk as cdk

from cdk.notifications_stack import NotificationsStack


app = cdk.App()
NotificationsStack(app, "IntercomNotificationsStack")

app.synth()
