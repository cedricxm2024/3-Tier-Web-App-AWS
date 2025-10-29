# Application Tier Module

## Purpose
This module provisions the **Application Tier** of the 3-tier web application.  
It includes:

- A **t2.micro EC2 instance** in a private subnet.
- A **security group** that allows traffic **only from the Web Tier** on port 8080.
- Automatic installation of **NGINX** via `user-data` for demonstration purposes.

The App Tier handles the **business logic** and communicates privately with the Database Tier.

---

## Inputs

| Variable           | Description                                  |
|-------------------|----------------------------------------------|
| `project_name`     | Prefix for resource names                     |
| `vpc_id`           | VPC ID where resources will be deployed      |
| `private_subnet_id` | Private subnet for EC2 deployment            |
| `web_sg_id`        | Security Group ID of Web Tier for ingress   |
| `key_name`         | EC2 Key Pair for SSH access                  |

---

## Outputs

| Output           | Description                                  |
|-----------------|----------------------------------------------|
| `app_instance_id` | ID of the App EC2 instance                  |
| `app_private_ip`  | Private IP of the App EC2                   |
| `app_sg_id`       | Security Group ID for the App EC2           |

---

## Usage Example

```hcl
module "app" {
  source            = "../modules/app"
  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnets[0]
  web_sg_id         = module.web.web_sg_id
  key_name          = var.key_name
}
