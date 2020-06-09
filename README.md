# Aviatrix Transit Network Module
This module builds a Transit architecture allowing hybrid, cross-region as well as cross cloud connectivity by leveraging Aviatrix Gateways in a repeatable design pattern.

## Who Maintains and Approves this Module? 
Aviatrix Solution Architect Team

## Usage
```
module "aviatrix-create-transit-aws-area1" {
  source         = "./transit_net"
  cloud_type     = 1
  region         = var.aws_region
  account_name   = var.aws_account_name
  avtx_gw_size   = var.aws_transit_gw_size
}
```
## Inputs
```
  cloud_type     = (Required) Cloud service provider maps to AWS(1), GCP(4), AZURE(8), OCI(16), and AWSGov(256)
  region         = (Required) Cloud service provider region
  account_name   = (Required) Cloud service provider account name used on the Aviatrix Controller
  avtx_gw_size   = (Required) Cloud service provider instance size
```
## Outputs
Transit VPC/VNET ID

Aviatrix Transit VPC/VNET CIDR

Aviatrix Transit Gateway Name

Aviatrix Transit Gateway Public IP

Aviatrix Transit HA Gateway Public IP

Aviatrix Transit Gateway Private IP
