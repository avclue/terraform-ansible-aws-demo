# Static website Setup using Terraform and Ansible

In this project, we are using Terraform to create the infrastructure to support a webserver which serves a static website, setup with Ansible, all on AWS.

## Getting Started

First one needs to run terraform with AWS access key and security key, so you'll need to get you secret keys from IAM in the AWS console for your account.
If you don't already have them in ~/.aws/credentials, odds are you need to create a new set of keys in IAM, as you're only given access to them once..

Once you have the credentials, tell the CLI about them with:

```shell
 aws configure
```


## Terraform commands to provision the Infrastructure:

``` shell
cd terraform-aws
```
optionally, you may wish to edit the deployment, such as the Region, or CIDR block of the VPC or the subnet, etc.

```shell
vi variables.tf
```

```shell
terraform init
 
terraform plan -out terraformplan.out

terraform apply terraformplan.out
```
NOTE:  One of the outputs of the terraform apply command will be the "public_ip".  You'll need that, so go ahead and copy it.  The output will look something like:

```shell
Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate

Outputs:

public_dns = "ec2-54-213-5-156.us-west-2.compute.amazonaws.com"
public_ip = "54.213.5.156"
tags = tomap({
  "Environment" = "Demo"
})

```
Your IP and DNS name will be different.

#### Make sure you note the public_ip or the public_dns so you can connect to the webserver.

## ansible playbook to provision the webserver on the new generic instance.

From the ansible-aws-demo directory, edit the inventory file and add the public IP from the newly created webserver.

```shell
cd ../ansible-aws
vi inventory
```

Actual ansible command:

```shell
ansible-playbook playbook.yml
```

At this point, you can put the public_ip in your browser, and you'll be able to see the static page we deployed with ansible.

Then finally:

```shell
terraform destroy 
```

to tear it all down and make sure you don't get charged.
