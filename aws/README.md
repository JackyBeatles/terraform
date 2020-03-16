Pre-requisites
===============
## Configuration IAM
```bash
aws iam create-group --group-name aws-group 

aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --group-name aws-group
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonVPCFullAccess --group-name aws-group 

aws iam create-user --user-name aws-user01

aws iam add-user-to-group --user-name aws-user01 --group-name aws-group

aws configure --profile aws-user01  

```
## Setup Credential

##
```bash

aws configure set profile.aws-user01.aws_secret_access_key <changeme>
aws configure set profile.aws-user01.aws_access_key_id <changeme>
aws configure set profile.aws-user01.region <changeme>
```
