1. Start localstack by running the following command

```
localstack start -d
```
Run the following to check status
```
localstack status
```
2. To formmat and validate terraform code, run the following.

```
terraform fmt
```

```
terraform validate
```

3. Run the folllowing command to deploy s3 bucket

```
terraform init
```

```
terraform plan
```

```
terraform apply
```

4. Check if s3 bucket existed in localstack

```
awslocal s3 ls
```

5. Check terraform state

```
terraform state list
terraform state show aws_s3_bucket.state
```


