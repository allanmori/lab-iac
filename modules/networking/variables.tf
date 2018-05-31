variable "vpc_cidr" {
  description = "CIDR block da vpc"
}

variable "public_subnet_cidr" {
  type        = "list"
  description = "CIDR block para subnet pública"
}

variable "private_subnet_cidr" {
  type        = "list"
  description = "CIDR block para subnet privada"
}

variable "environment" {
  description = "The environment"
}

variable "aws_region" {
  description = "Região onde os hosts serão criado"
}

variable "availability_zones" {
  type        = "list"
  description = "Zona de disponibilidade"
}

variable "key_name" {
  description = "A chave pública para os hosts"
}
