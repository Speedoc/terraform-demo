1. Run the folllowing command to deploy s3 bucket

```
terraform init
```

```
terraform fmt
```

```
terraform validate
```

```
terraform plan
```

```
terraform apply
```

2. Check if s3 bucket existed in localstack

```
awslocal s3 ls
```

3. Check terraform state

```
terraform state list
terraform state show aws_s3_bucket.state
```


