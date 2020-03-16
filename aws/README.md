Pre-requisites
===============
## Configuration IAM
```bash
# Create aws Group
aws iam create-group --group-name aws-group 

# Create iam allow policy ec2 and vpc full access to group
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --group-name aws-group
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonVPCFullAccess --group-name aws-group 
# create aws user
aws iam create-user --user-name aws-user01
# add user to group
aws iam add-user-to-group --user-name aws-user01 --group-name aws-group

```
## Setup Credential
```bash
aws configure set profile.aws-user01.aws_secret_access_key <changeme>
aws configure set profile.aws-user01.aws_access_key_id <changeme>
aws configure set profile.aws-user01.region <changeme>
```
## 