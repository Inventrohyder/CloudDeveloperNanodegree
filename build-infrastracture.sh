#! /bin/zsh
aws cloudformation create-stack \
	--stack-name static-site-stack \
	--template-body file://website-s3.yaml
