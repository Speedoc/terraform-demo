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

2. Go to http://localhost:9090 and http://localhost to check if docker is deployed with the correct image

3. Try to run terraform apply and notice that nothing need to change

4. Run the following command to force resource to be recreated 

```
terraform state list
terraform taint module.docker-2.docker_container.foo
terraform apply
```