# Web Tier Module

## Purpose
This module provisions the **Web Tier** of the 3-tier web application on AWS.  
It creates:

- A **t2.micro EC2 instance** in a public subnet.
- A **security group** allowing HTTP (port 80) and SSH (port 22) access.
- Automatic installation of **NGINX** via `user-data`.

The Web Tier serves as the **front-facing layer**, handling incoming traffic and forwarding requests to the App Tier.

---

## Inputs

| Variable         | Description                                  |
|-----------------|----------------------------------------------|
| `project_name`   | Prefix used for resource names               |
| `vpc_id`         | VPC ID where resources will be deployed      |
| `public_subnet_id` | Public subnet ID for EC2 deployment        |
| `key_name`       | EC2 Key Pair for SSH access                  |

---

## Outputs

| Output           | Description                                  |
|-----------------|----------------------------------------------|
| `web_instance_id` | ID of the Web EC2 instance                  |
| `web_public_ip`  | Public IP of the Web EC2 instance           |
| `web_sg_id`      | Security Group ID for the Web EC2           |

---

## Usage Example

```hcl
module "web" {
  source           = "../modules/web"
  project_name     = var.project_name
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnets[0]
  key_name         = var.key_name
}
