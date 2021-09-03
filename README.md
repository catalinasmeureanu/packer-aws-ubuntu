# packer-aws-ubuntu

Sample code to build AMI image on AWS with HashiCorp Packer

$ packer init .

$ packer fmt .

$ packer validate .

$ doormat -r

$ doormat aws --account my_group_account

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS
export AWS_SESSION_TOKEN

$ packer build template.pkr.hcl