variable "environment" {
  description = "The environment"
}

variable "vpc_id" {
  description = "ID da VPC"
}

variable "availability_zones" {
  type        = "list"
  description = "Zonas de disponibilidade"
}

variable "security_groups_ids" {
  type        = "list"
  description = "O SGs para usar"
}

variable "subnets_ids" {
  type        = "list"
  description = "As subnets privadas"
}

variable "public_subnet_ids" {
  type        = "list"
  description = "As subnets públicas"
}

variable "repository_name" {

  description = "O nome do repositório"
}

