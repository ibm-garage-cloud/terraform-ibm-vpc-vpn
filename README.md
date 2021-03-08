# Use OpenVPN to access virtual server instances running in a virtual private cloud

Virtual Private Cloud (VPC) come with an additional layer of security as your workload can be completely hidden from the public Internet. But there are times when you will want to get into this private network. A common practice is to use a bastion host to jump into your VPC from your local machine as example. Another option is to install a VPN software inside your VPC to extend the secure VPC network to your local network.

OpenVPN is a popular VPN software solution that can be easily installed on a server and offer a simple way to reach all the servers in your VPC from your local machine.

This repo shows how to deploy OpenVPN inside a VPC using Terraform and Ansible.

<table cellspacing="10" border="0">
  <tr>
    <td>
      <img src="./architecture.png" />
    </td>
    <td>
      <img src="./openvpn.png" />
    </td>
  </tr>
</table>

- README.md - provides a description of the module
- main.tf - defiens the logic for the module
- variables.tf (optional) - defines the input variables for the module
- outputs.tf (optional) - defines the values that are output from the module

Beyond those files, any other content can be added and organized however you see fit. For example, you can add a `scripts/` directory
that contains shell scripts executed by a `local-exec` `null_resource` in the terraform module. The contents will depend on what your
module does and how it does it.

## Instructions for creating a new module

1. Update the title and description in the README to match the module you are creating
2. Fill out the remaining sections in the README template as appropriate
3. Implement your logic in the in the main.tf, variables.tf, and outputs.tf
4. Use releases/tags to manage release versions of your module

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v12
- kubectl

### Terraform providers

- IBM Cloud provider >= 1.5.3
- Helm provider >= 1.1.1 (provided by Terraform)

## Module dependencies

This module makes use of the output from other modules:

- Cluster - github.com/ibm-garage-cloud/terraform-ibm-container-platform.git
- Namespace - github.com/ibm-garage-clout/terraform-cluster-namespace.git
- etc

## Example usage

```hcl-terraform
module "dev_tools_argocd" {
  source = "github.com/ibm-garage-cloud/terraform-tools-argocd.git?ref=v1.0.0"

  cluster_config_file = module.dev_cluster.config_file_path
  cluster_type        = module.dev_cluster.type
  app_namespace       = module.dev_cluster_namespaces.tools_namespace_name
  ingress_subdomain   = module.dev_cluster.ingress_hostname
  olm_namespace       = module.dev_software_olm.olm_namespace
  operator_namespace  = module.dev_software_olm.target_namespace
  name                = "argocd"
}
```

