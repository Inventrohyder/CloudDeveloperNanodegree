#! /bin/zsh

export DISTRIBUTION_URL=$(aws cloudfront get-distribution --id E18XTME4ZCQH2M | jq .Distribution.DomainName)

echo "Distribution URL: $DISTRIBUTION_URL"

export BUCKET_URL="https://my-549763406380-bucket.s3.amazonaws.com"

echo "Bucket URL: http://my-549763406380-bucket.s3-website-us-east-1.amazonaws.com"

echo "index.html link: https://my-549763406380-bucket.s3.amazonaws.com/index.html"
