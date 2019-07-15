#!/usr/bin/env python3

from aws_cdk import core

from aws.aws_stack import AwsStack


app = core.App()
AwsStack(app, "aws")

app.synth()
