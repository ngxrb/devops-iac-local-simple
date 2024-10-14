# Infrastructure as Code

## Development

```shell
cd local-dev
terraform init
terraform plan
terraform apply
```

## Preproduction

```shell
cd local-pre
terraform init
terraform plan
terraform apply
```

## Production

```shell
cd local-prod
terraform init
terraform plan
terraform apply
```
## DevOps

```shell
cd local-devops
../scripts/import_resources.sh
terraform init
terraform plan
terraform apply
```