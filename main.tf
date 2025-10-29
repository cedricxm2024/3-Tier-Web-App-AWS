module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  cidr_block   = "10.0.0.0/16"  
}

module "web" {
  source           = "./modules/web"
  project_name     = var.project_name
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnets[0]
  key_name         = var.key_name
}

module "app" {
  source            = "./modules/app"
  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnets[0]
  web_sg_id         = module.web.web_sg_id
  key_name          = var.key_name
}

module "db" {
  source          = "./modules/db"
  project_name    = var.project_name
  private_subnets = module.vpc.private_subnets
  app_sg_id       = module.app.app_sg_id
}
