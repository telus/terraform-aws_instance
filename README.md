terraform-aws_instance terraform module
=======================

A terraform module for managing EC2 instances running EBS volumes
* Assumes you're making your instances in a VPC
* Can do some basic root block volume management
* Includes needed tags to run forge

Module Input Variables
----------------------

Defaults:
- `instance_type` - The EC2 instance type, defaults to m3.medium
- `instance_root_volume_size` - This is the size of the disk the instance is created with. Defaults to 8GB
- `instance_root_volume_type` - EBS volume type of the disk the instance is created with. Defaults to standard. 
- `instance_root_volume_provisioned_io` - Provisioned IO the root volume the instance is created with. Defaults to 0.
- `instance_root_volume_delete_on_termination` - Controls when the instance is terminated, if the EBS volume terminates itself as well. Defaults to true
- `environment` - The environment type this instance is tagged with.  Valid values are: production, staging, uet, or development. Defaults to development
- `instance_iam_instance_profile` - The IAM instance profile the instance is created with.  Default is autonomous

Required:
- `subnet_id` - The VPC subnet to place the instance in.
- `security_group_ids` - The security_group ids to attach the instance to. Comma delimited list.
- `role` - The instance name you want, this is used to populate a portion of the Name tag and wholly the Role tag, in line with our conventions.
- `user_data` - The path to the user_data file. Terraform will include the contents of this file while launching the instance.


Module Outputs
--------------

- `instance_public_ip` - The public IP of the created instance (if it has one.)
- `instance_id` - The instance id of the created instance.
- `instance_private_ip` - The private IP of the created instance.

Usage
-----

You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "instance" {
  source = "git::ssh://git@github.com/telusdigital/terraform-aws_instance"

  project = "uet"
  role = "jenkins"
  environment = "production"
  subnet_id = "${module.vpc.public_subnets}"
  security_group_ids = "${module.security_group_web.security_group_id},${module.security_group_ssh.security_group_id}"
  user_data = "${file("resources/user_data.sh")}"
  instance_type = "m3.medium"
}
```

2. You can reference the created AWS instance via: "${module.instance.id}"

Authors
=======

Created and maintained by [Phil Dufault](https://github.com/pdufault) (phil.dufault@telus.com)
