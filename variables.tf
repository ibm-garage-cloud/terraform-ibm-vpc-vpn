/*variable "vpn_vpc_bastion" {
  # IBM Cloud API key allowed to create resource group, VPC, VSI, SSH key
  ibmcloud_api_key=""

  # a prefix for all resource names
  basename="vpn_vpc"

  # where to deploy the resources
  region="us-south"

  # name of an existing VPC SSH key to inject in all VSI - can be left empty
  vpc_ssh_key_name=""

  # (Optional) Name of an existing resource group where to create resources
  existing_resource_group_name=""

  # (Optional) Name of an existing VPC where to add the bastion
  existing_vpc_name=""

  # (Optional) ID of an existing subnet where to add the bastion. VPC name must be set too
  existing_subnet_id=""
}*/

variable "ibmcloud_api_key" {
  type        = string
  description = "The api key for IBM Cloud access"
}

variable "basename" {
  type        = string
  description = "a prefix for all resource names"
  default     = "vpn_vpc"
}

variable "region" {
  type        = string
  description = "A region to deploy the resources"
  #default     = "us-south"
}

variable "vpc_ssh_key_name" {
  type        = string
  description = "Name of an existing VPC SSH key to inject in all VSI - can be left empty"
  #default     = ""
}

variable "existing_resource_group_name" {
  type        = string
  description = "Name of an existing resource group where to create resources - can be left empty"
  default     = ""
}

variable "existing_vpc_name" {
  type        = string
  description = "Name of an existing VPC where to add the bastion - can be left empty"
  #default     = ""
}

variable "existing_subnet_id" {
  type        = string
  description = "ID of an existing subnet where to add the bastion - can be left empty"
  #default     = ""
}

