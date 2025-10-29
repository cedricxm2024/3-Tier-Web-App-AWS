
---

## **4️⃣ `modules/vpc/README.md`**

```markdown
# VPC Module

## Purpose
This module provisions the **networking layer** for the 3-tier architecture.  
It includes:

- A **VPC** with a customizable CIDR block.
- **Public and private subnets** across multiple availability zones.
- Internet Gateway for public subnets.
- Route tables and associations.
- Modular outputs to be consumed by Web, App, and DB tiers.

This module ensures **network isolation** and **scalability** following enterprise best practices.

---

## Inputs

| Variable      | Description                                  |
|---------------|----------------------------------------------|
| `project_name` | Prefix for resource names                     |
| `cidr_block`   | CIDR block for the VPC (default: 10.0.0.0/16)|

---

## Outputs

| Output             | Description                                  |
|-------------------|----------------------------------------------|
| `vpc_id`          | ID of the created VPC                         |
| `public_subnets`  | List of public subnet IDs                     |
| `private_subnets` | List of private subnet IDs                    |
| `igw_id`          | Internet Gateway ID                           |
| `route_table_ids` | List of route table IDs                       |

---

## Usage Example

```hcl
module "vpc" {
  source       = "../modules/vpc"
  project_name = var.project_name
  cidr_block   = "10.0.0.0/16"
}
