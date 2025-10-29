# 3-Tier-Web-App-AWS

# 3-Tier Web Application on AWS using Terraform

## 🚀 Project Overview

This project demonstrates a **3-tier web application architecture** deployed entirely on **AWS** using **Terraform**. It is designed following **enterprise-level best practices**, is modular, reusable, and **free-tier compatible**, making it ideal for learning, prototyping, or testing scalable cloud infrastructures.

The architecture consists of:

1. **Web Tier (Public EC2)** – Serves HTTP traffic and acts as the front-facing interface.
2. **Application Tier (Private EC2)** – Handles application logic and internal processing.
3. **Database Tier (Private RDS MySQL)** – Stores persistent data securely.

All components are provisioned **automatically**, and EC2 instances run **NGINX** out-of-the-box via `user-data`.

---

## 🏗 Architecture Diagram

       Internet
          |
     [Web EC2]
      (Port 80)
          |
     [App EC2]
      (Port 8080)
          |
   [RDS MySQL DB]


- **Web EC2**: Public subnet, exposed only on HTTP (80) and SSH (22).  
- **App EC2**: Private subnet, accessible only by Web EC2 on port 8080.  
- **RDS MySQL**: Private subnet, accessible only by App EC2.  
- **Security groups** enforce strict **least privilege access** between tiers.  

---

## 📂 Project Structure

erraform-3tier-webapp/
├── bin/
│ └── install_terraform.sh # Optional Terraform installer
├── modules/
│ ├── vpc/ # VPC, subnets, routing
│ ├── web/ # Web tier EC2 + security group
│ ├── app/ # Application tier EC2 + security group
│ └── db/ # RDS MySQL + subnet group
├── main.tf # Root Terraform configuration
├── providers.tf # Provider configuration
├── variables.tf # Input variables
├── outputs.tf # Terraform outputs
└── terraform.tfvars # Environment-specific variables

---

## ⚡ Key Features

- **Modular Infrastructure** – Each tier is a separate module for maintainability and reusability.
- **Free-Tier Compatible** – Uses `t2.micro` EC2 and `db.t2.micro` RDS instances.
- **Secure by Design** –  
  - Public access only where necessary (Web EC2).  
  - Private communication between App and DB tiers.  
  - Security groups strictly enforce **least privilege** principles.
- **Automated Provisioning** – EC2 instances install **NGINX** automatically via `user-data`.
- **Enterprise Ready** – Follows industry-standard conventions for naming, tagging, and modularity.
- **GitOps Friendly** – Can be integrated with CI/CD pipelines for automated deployments.

---

## 🛠 Prerequisites

- **AWS Account** with free-tier eligibility.  
- **Terraform ≥ 1.5.0** installed.  
- **AWS CLI** configured with credentials.  
- Existing **EC2 Key Pair** for SSH access.

---

## 🚀 Deployment Instructions

1. **Clone the repository**:

```bash
git clone <repo-url>
cd terraform-3tier-webapp

chmod +x bin/install_terraform.sh
./bin/install_terraform.sh

terraform init
terraform plan
terraform apply

Review the plan and confirm.

Terraform outputs include:

Web EC2 Public IP

App EC2 Private IP

RDS Endpoint

Verify Deployment:

Open a browser and navigate to the Web EC2 public IP. You should see the default NGINX page.

From Web EC2, test access to App EC2 via:curl http://<APP_PRIVATE_IP>:8080
