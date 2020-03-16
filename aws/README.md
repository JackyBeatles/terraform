Pre-requisites
===============
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
## Setup Credential
```bash
aws configure set profile.<xxxxx>.aws_secret_access_key <xxxxx>
aws configure set profile.<xxxxx>.aws_access_key_id <xxxxxx>
aws configure set profile.<xxxxx>.region <xxxxx>
```
## 