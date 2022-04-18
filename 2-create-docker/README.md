1. Run the folllowing command to deploy docker container

```
terraform init
```

```
terraform plan
```

```
terraform apply
```

2. Go to http://localhost:8080 to check if docker is deployed

3. Copy remote state in s3 to local

```
awslocal s3 cp s3://terraform-state/demo-2.tfstate .
```

4. View file in IDE

5. Modify external port to 9999 in main.tf and apply

```
terraform plan
terraform apply
```

6. Access http://localhost:9999 to check if docker is accessible