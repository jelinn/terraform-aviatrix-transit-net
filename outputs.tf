output "tvpc_id" {
  value = aviatrix_vpc.aws_transit.vpc_id
}

output "avtx_gw_name" {
  value = aviatrix_transit_gateway.transit_gateway_tvpc.gw_name
}

output "transit_gw_public_ip" {
  value = aviatrix_transit_gateway.transit_gateway_tvpc.eip
}

output "transit_gw_private_ip" {
  value = aviatrix_transit_gateway.transit_gateway_tvpc.private_ip
}

output "transit_hagw_public_ip" {
  value = aviatrix_transit_gateway.transit_gateway_tvpc.ha_eip
}

output "tvpc_cidr" {
  value = aviatrix_vpc.aws_transit.cidr
}
#output "transit_hagw_private_ip" {
#  value = aviatrix_transit_gateway.transit_gateway_tvpc.eip
#}
