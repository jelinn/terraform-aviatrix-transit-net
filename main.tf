resource "random_integer" "tvpc_subnet" {
  min = 1
  max = 250
}

resource "aviatrix_vpc" "aws_transit" {
  cloud_type           = var.cloud_type
  account_name         = var.account_name
  region               = var.region
  name                 = (var.region == "us-east-2") ? "transit-vpc${var.cloud_type}-east2" : "transit-vpc${var.cloud_type}"
  cidr                 = cidrsubnet("10.0.0.0/8", 8, random_integer.tvpc_subnet.result)
  aviatrix_transit_vpc = (var.cloud_type == 1) ? true : false
  aviatrix_firenet_vpc = (var.cloud_type == 1) ? false: true
}

resource "aviatrix_transit_gateway" "transit_gateway_tvpc" {
  cloud_type                    = var.cloud_type
  vpc_reg                       = var.region
  vpc_id                        = aviatrix_vpc.aws_transit.vpc_id
  account_name                  = aviatrix_vpc.aws_transit.account_name
  gw_name                       = (var.region == "us-east-2") ? "tvpc-gw${var.cloud_type}-east2" : "tvpc-gw${var.cloud_type}"
  ha_gw_size                    = var.avtx_gw_size
  gw_size                       = var.avtx_gw_size
  subnet                        = (var.cloud_type == 1) ? aviatrix_vpc.aws_transit.subnets[5].cidr : aviatrix_vpc.aws_transit.subnets[2].cidr
  ha_subnet                     = (var.cloud_type == 1) ? aviatrix_vpc.aws_transit.subnets[7].cidr : aviatrix_vpc.aws_transit.subnets[3].cidr
  enable_active_mesh            = true
  enable_hybrid_connection      = (var.cloud_type == 1) ? true : false
  connected_transit             = true
}
