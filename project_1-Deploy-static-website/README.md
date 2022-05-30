# Deploy A Static Site on AWS

## Build the infrastructure

The infrastructure includes a Stack consisting of a public S3 bucket.

The following image shows the infrastructure we are building.

![Cloud Formation Design](./ProjectImages/CloudFormationDesign.png)

To build the infrastructure run the following:

```zsh
$ ./build-infrastracture.sh
{
    "StackId": "arn:aws:cloudformation:us-east-1:549763406380:stack/static-site-stack/e3347ce0-e00c-11ec-a6a8-0edcadfa9803"
}
```

> **Note:** The output is an example of the output.

## Deploy the Static Site to S3

> Before moving to this step, make sure you have [built the infrastructure](#build-the-infrastructure).
> 
> To check if the infrastructure has been built use the following
> (the status would be CREATE\_COMPLETE):
>
> ```zsh
> $ aws cloudformation list-stacks
> {
>     "StackSummaries": [
>         {
>             "StackId": "arn:aws:cloudformation:us-east-1:549763406380:stack/static-site-stack/e3347ce0-e00c-11ec-a6a8-0edcadfa9803",
>             "StackName": "static-site-stack",
>             "CreationTime": "2022-05-30T11:37:29.834000+00:00",
>             "StackStatus": "CREATE_COMPLETE",
>             "DriftInformation": {
>                 "StackDriftStatus": "NOT_CHECKED"
>             }
>         }]
> }
> ```

Next, we need to upload the static webpage files to the S3 Bucket.

Move to the static site folder

```zsh
cd udacity-starter-website
```

Then copy the files to the s3 bucket.

```zsh
$ ./deploy.sh
{
    "ETag": "\"440ce1613878ee93164fb77fc6475a46\""
}
upload: vendor/bootstrap/.DS_Store to s3://my-549763406380-bucket/vendor/bootstrap/.DS_Store
upload: vendor/bootstrap/css/bootstrap-reboot.css to s3://my-549763406380-bucket/vendor/bootstrap/css/bootstrap-reboot.css
upload: vendor/bootstrap/css/bootstrap-reboot.min.css to s3://my-549763406380-bucket/vendor/bootstrap/css/bootstrap-reboot.min.css
upload: vendor/.DS_Store to s3://my-549763406380-bucket/vendor/.DS_Store              
upload: vendor/bootstrap/css/bootstrap-reboot.min.css.map to s3://my-549763406380-bucket/vendor/bootstrap/css/bootstrap-reboot.min.css.map
upload: vendor/bootstrap/css/bootstrap-grid.css to s3://my-549763406380-bucket/vendor/bootstrap/css/bootstrap-grid.css
upload: vendor/bootstrap/css/bootstrap-grid.min.css to s3://my-549763406380-bucket/vendor/bootstrap/css/bootstrap-grid.min.css
upload: vendor/bootstrap/css/bootstrap-reboot.css.map to s3://my-549763406380-bucket/vendor/bootstrap/css/bootstrap-reboot.css.map
...
```

## Get the links

Use the `./show-links.sh` file to get the links to the site.

```zsh
$ ./show-links.sh
Distribution URL: "dpx0p65hefw3h.cloudfront.net"
Bucket URL: http://my-549763406380-bucket.s3-website-us-east-1.amazonaws.com
index.html link: https://my-549763406380-bucket.s3.amazonaws.com/index.html
```

The _Distribution URL_ takes a while before showing expected content but the other two links
are immediately available.
