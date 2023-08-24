variable "resource_group_name" {
  default = "Neo_Collectius_Group"
}

variable "agent_count" {
  default = 3
}

variable "dns_prefix" {
  default = "ak8s"
}

variable "cluster_name" {
  default = "ak8s"
}

variable "sp_client_id" {
  type      = string
  sensitive = true
}

variable "sp_client_secret" {
  type      = string
  sensitive = true
}