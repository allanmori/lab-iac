/*====
Variaveis utilizada em todos o modulos
======*/

variable "aws_region" {
    description = "REGIAO PARA CRIACAO EC2 e VPC"
    default = "us-east-1"
}

locals {
  production_availability_zones = ["us-east-1a", "us-east-1b"]
}

module "networking" {
  source               = "./modules/networking"
  environment          = "production"
  vpc_cidr             = "10.20.0.0/16"
  public_subnet_cidr  = ["10.30.0.0/24", "10.20.1.10/24"]
  private_subnet_cidr = ["10.20.10.0/24","10.20.20.0/24"]
  aws_region               = "${var.aws_region}"
  availability_zones   = "${local.production_availability_zones}"
  key_name             = "production_key"
}

module "ecs" {
  source              = "./modules/ecs"
  environment         = "production"
  vpc_id              = "${module.networking.vpc_id}"
  availability_zones  = "${local.production_availability_zones}"
  repository_name     = "projeto-teste/production"
  subnets_ids         = ["${module.networking.private_subnet_id}"]
  public_subnet_ids   = ["${module.networking.public_subnet_id}"]
  security_groups_ids = ["${module.networking.security_groups_ids}"]
}

/*====
Variaveis para o CloudFront
======*/

# specific to our site
variable "root_dominio" {
    default = "projeto-teste.com.br"
}

variable "blog_bucket_subdominio" {
    default = "tecnologia-branch"
}

variable "blog_public_subdominio" {
    default = "blog"
}

