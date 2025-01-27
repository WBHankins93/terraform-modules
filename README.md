# Terraform Modules Repository

This repository contains reusable Terraform modules and configurations for provisioning cloud infrastructure.

## Directory Structure
- **modules/**: Reusable Terraform modules.
- **environments/**: Environment-specific configurations.
- **scripts/**: Utility scripts to aid Terraform workflows.

---

### **1. modules/**
Reusable Terraform modules for different infrastructure components. Each module is self-contained with its own configurations, variables, and outputs.

- **aws/**: AWS-specific modules (e.g., ECS, RDS, VPC).
  - `main.tf`: Core resources for the specific service.
  - `variables.tf`: Input variables for module configuration.
  - `outputs.tf`: Outputs exported for consumption by other modules.
  - `README.md`: Module-specific documentation.

- **ibmc/**: IBM Cloud-specific modules.
  - **vpc/**:
    - `main.tf`: Defines IBM Cloud VPC resources like subnets and public gateways.
    - `variables.tf`: Input variables for configuring VPC (e.g., subnets, zones).
    - `outputs.tf`: Outputs such as VPC ID, subnet IDs, and public gateway IDs.
    - `README.md`: Documentation for the VPC module, describing input/output usage.

---

### **2. environments/**
Environment-specific configurations for staging, development, and production. These are based on reusable modules in the `modules/` directory.

- **dev/**: Development environment configurations.
  - `main.tf`: Calls modules like `vpc` and `compute` for IBM Cloud or AWS.
  - `terraform.tfvars`: Default variable values for development (e.g., CIDR blocks, image names).
  - `variables.tf`: Defines input variables used in the `main.tf`.

- **staging/**: Staging environment configurations.
  - Same file structure as `dev/`.

- **production/**: Production environment configurations.
  - `main.tf`: Uses modules to provision production-ready resources.
  - `variables.tf`: Production-specific variables (e.g., larger instance sizes, additional resources).
  - `outputs.tf`: Exports production infrastructure outputs.

---

### **3. scripts/**
Utility scripts for managing Terraform workflows efficiently. These scripts abstract common Terraform commands like `apply`, `plan`, and `destroy`, making it easier to work across providers and environments.

- **apply.sh**:
  - Applies the Terraform configuration for a given provider (`aws` or `ibmc`) and environment.
  - Automatically initializes and validates the configuration before applying.
  - Usage: `./apply.sh <provider> <environment>` (e.g., `./apply.sh ibmc prod`).

- **plan.sh**:
  - Generates and saves a Terraform execution plan for review.
  - Usage: `./plan.sh <provider> <environment>` (e.g., `./plan.sh aws staging`).

- **destroy.sh**:
  - Destroys resources for a specific environment and provider (optional future implementation).
  - Usage: `./destroy.sh <provider> <environment>`.

- **init.sh**:
  - Initializes the Terraform backend and providers for a specified environment.
  - Usage: `./init.sh <provider> <environment>`.

---

### **4. Root Files**
- **README.md**:
  - This file. Provides documentation for repository structure and usage.
- **terraform.tfvars**:
  - Common global variables for Terraform configurations (if needed, can be environment-specific).
- **.gitignore**:
  - Excludes sensitive files such as `.terraform` directories, `.tfstate` files, and Terraform plans.

---

## **Supported Components**

### **IBM Cloud (IBM Cloud Infrastructure):**
- **Networking**:
  - VPC, Subnets, Security Groups, DNS, Load Balancers, Public Gateways.
- **Compute**:
  - Virtual servers (VMs) using IBM Cloud compute profiles.
- **Storage**:
  - Block and object storage configurations.
- **Databases**:
  - PostgreSQL provisioning and management.

### **AWS (planned modules):**
- **Compute**:
  - ECS clusters, Auto Scaling Groups.
- **Networking**:
  - VPC, Subnets, Route Tables, and Security Groups.
- **Databases**:
  - RDS (PostgreSQL, MySQL).

---

## **Getting Started**

### **Prerequisites**
1. Terraform installed locally (`>= v1.0`).
2. Access to IBM Cloud and/or AWS with proper credentials.
3. Environment-specific `terraform.tfvars` files configured with required variables.

---

### **Workflow**

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/<your-repo>/terraform-modules.git
   cd terraform-modules
