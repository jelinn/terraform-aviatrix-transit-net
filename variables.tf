locals {
  aws   = 1
  gcp   = 4
  azure = 8
}

variable cloud_type {
  default = 1
}

variable region {
  default = "us-east-1"
}

variable avtx_gw_size {
  default = "t2.micro"
}

variable hpe {
  default = false
}

variable account_name {}
#variable aws_transit_gw {}
