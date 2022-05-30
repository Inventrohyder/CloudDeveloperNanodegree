#! /bin/zsh

aws cloudformation delete-stack --stack-name static-site-stack
export bucket_name=my-549763406380-bucket

aws s3 rb --force s3://$bucket_name
