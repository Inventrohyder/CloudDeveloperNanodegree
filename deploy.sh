#! /bin/zsh
aws cloudformation create-stack \
	--stack-name static-site-stack
	--template-body file://website-s3.yaml

cd udacity-starter-website

aws s3api put-object --bucket my-549763406380-bucket --key index.html --body index.html 
aws s3 cp vendor/ s3://my-549763406380-bucket/vendor/ --recursive
aws s3 cp css/ s3://my-549763406380-bucket/css/ --recursive
aws s3 cp img/ s3://my-549763406380-bucket/img/ --recursive
