
---

## **3️⃣ `modules/db/README.md`**

```markdown
# Database Tier Module

## Purpose
This module provisions the **Database Tier** using **AWS RDS (MySQL)**.  
It includes:

- A **db.t2.micro RDS instance** in private subnets.
- A **subnet group** for RDS placement.
- Security group allowing access only from the App Tier.

The Database Tier provides **persistent storage** for the application.

---

## Inputs

| Variable        | Description                                  |
|----------------|----------------------------------------------|
| `project_name`  | Prefix for resource names                     |
| `db_name`       | Initial database name                         |
| `db_user`       | Master username for the database             |
| `db_password`   | Master password for the database             |
| `subnet_ids`    | Private subnet IDs for RDS deployment        |
| `app_sg_id`     | Security Group ID of App Tier for ingress    |

---

## Outputs

| Output           | Description                                |
|-----------------|--------------------------------------------|
| `db_instance_id` | RDS instance ID                             |
| `db_endpoint`    | Connection endpoint for the database       |
| `db_sg_id`       | Security Group ID for the database         |

---

## Usage Example

```hcl
module "db" {
  source       = "../modules/db"
  project_name = var.project_name
  db_name      = "appdb"
  db_user      = "admin"
  db_password  = "P@ssw0rd123"
  subnet_ids   = module.vpc.private_subnets
  app_sg_id    = module.app.app_sg_id
}
