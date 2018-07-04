# Variables with defaults
variable "aws_region" {
  description = "The selects the AWS region the instance is launched into. Choose the AWS region that's closest to the majority of your team's location."
  default = "us-west-1"
}

variable "instance_type" {
  description = "Set this variable to control the resources that are allocated to the instance"
  default = "m3.medium"
}

variable "ami" {
  description = "The AMI you want to use with your instance"
  default = "${data.aws_ami.default.id}"
}

variable "instance_iam_instance_profile" {
  description = "This is the IAM instance profile the instance is launched with.  Default is autonomous so forge can run."
  default = "autonomous"
}

variable "instance_root_volume_size" {
  description = "This is the size of the disk the instance is launched with. Defaulted to 8GB"
  default = "8"
}

variable "instance_root_volume_type" {
  description = "This is the EBS volume type of the disk the instance is launched with. Defaults to standard. Options: standard, gp2"
  default = "standard"
}

variable "instance_root_volume_provisioned_io" {
  description = "This is the provisioned IO the root volume the instance is launched with. Optional."
  default = 0
}

variable "instance_root_volume_delete_on_termination" {
  description = "This setting controls when the instance is terminated, if the EBS volume terminates itself as well."
  default = "true"
}

variable "environment" {
  description = "The environment type this instance is tagged with.  Valid values are: production, staging, uet, or development. Defaults to development"
  default = "development"
}

# Required variables
variable "role" {
  description = "This is a string to describe the role, or the task that this instance preforms"
}

variable "project" {
  description = "This variable controls the prefix of your instance's name"
}

variable "vpc_id" {
  default = "The VPC to launch the instance into"
}

variable "subnet_id" {
  default = "The subnet to launch the instance into"
}

variable "security_group_ids" {
  description = "The security_group ids to attach the instance to"
}

variable "user_data" {
  description = "This is the user-data that the instance is launched with"
}

variable "associate_public_ip_address" {
  description = "Specifys if instance should have a public ip address"
  default = "false"
}
