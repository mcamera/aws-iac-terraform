# aws-iac-terraform

Code example for Infrastructure as Code using Terraform on the AWS Cloud.

## 1. Goal
Deploy a bucket and a python file in the AWS Cloud using Terraform as Infrasctructure as Code platform.

## 2. Requisites
### AWS CLI
To install the AWS Cli on a Linux system:
```
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
$ aws --version
```
To configure the AWS Cli:
`$ aws configure`

You will have to provide these information:
- AWS Access Key ID
- AWS Secret Access Key
- Default region name [us-east-1]
- Default output format [json]

### Terraform
[https://www.terraform.io/](https://www.terraform.io/)

**Option 1:** Binary file

1. To install Terraform, find the appropriate package for your system and download it as a zip archive in [this link](https://www.terraform.io/downloads.html).
2. After downloading Terraform, unzip the package.
3. Make sure that the terraform binary is available on your PATH. Use the command  bellow to confirm:
`$ echo $PATH`
4. Move the Terraform binary to one of the listed locations.
`$ mv ~/Downloads/terraform /usr/local/bin/`
  
**Option 2:** Linux Ubuntu:
```
$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
$ sudo apt-get update && sudo apt-get install terraform
```

**Enable tab completion**
`$ terraform -install-autocomplete`


## 3. Deploy Infrastructure

##### Complete the variables in the file `iac/variables.tf`
- base_bucket_name: "some name"
- environment: "dev" or "hml" or "prod"
- account_number: "123456789"
- region_id: "us-east-1"

##### Init Terraform
```
$ cd iac
$ terraform init
```

##### Format Terraform files
`$ terraform fmt`

##### Validade Terraform files
`$ terraform validate`

##### Show the execution plan
`$ terraform plan`

##### Deploy the infrastructure
`$ terraform apply`

## 4. Destroy Infrastructure
`$ terraform destroy`