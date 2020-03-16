Pre-requisites
===============
## Setup Credential for Defualt 
```bash
aws configure
```
## Configuration IAM
```bash
# Create aws Group
aws iam create-group --group-name <xxxxx> 

# Create iam allow policy ec2 and vpc full access to group
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --group-name <xxxxx>
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonVPCFullAccess --group-name <xxxxx> 
# create aws user
aws iam create-user --user-name <xxxxx>
# add user to group
aws iam add-user-to-group --user-name <xxxxx> --group-name <xxxxx>

```
## Setup Credential for Profile
```bash
aws configure set profile.<xxxxx>.aws_secret_access_key <xxxxx>
aws configure set profile.<xxxxx>.aws_access_key_id <xxxxxx>
aws configure set profile.<xxxxx>.region <xxxxx>
```

## edit Variable  to file  prod.tfvars
```bash

region = "ap-southeast-1"  # if your want change region
instance_name =  "web,db"  # if your want change instance name
instance_type= "t1.micro"  # if your want change instance type
profile= "user1"  # if your want change profile name

```

## Terrafrom deploy 
```bash
sudo terrafrom plan  -var-file=prod.tfvars  # show list resource 
sudo terrafrom apply  -var-file=prod.tfvars  # create resource
sudo terrafrom destroy  -var-file=prod.tfvars  # delete resource
```