# README: Instructions to Use the Repository

This repository contains Terraform configurations to manage AWS infrastructure. Follow the steps below to use the repository as-is and properly configure your environment.

## Prerequisites

1. Install [Terraform](https://www.terraform.io/downloads.html) on your machine.
2. Ensure you have valid AWS credentials with sufficient permissions to manage resources.
3. Clone this repository to your local machine:
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```

## Configuring the Variables File

### Step 1: Open or Create the `terraform.tfvars` File

The `terraform.tfvars` file is used to define the required variables for AWS authentication and region configuration. If the file does not exist, create it in the root of the repository.

### Step 2: Add the following entries

Replace placeholders with your actual AWS credentials:

```hcl
region     = "us-east-1"
access_key = "<YOUR_AWS_ACCESS_KEY>"
secret_key = "<YOUR_AWS_SECRET_KEY>"
```

### Step 3: Save the File

Ensure the file is saved with the correct values and do not share it publicly.

### Step 4: Generate AWS Access and Secret Keys (if not available)

If you do not have an AWS Access Key and Secret Key, follow these steps to create them:

1. Log in to the [AWS Management Console](https://aws.amazon.com/console/).
2. Navigate to the **IAM** (Identity and Access Management) service.
3. Select **Users** from the left menu.
4. Click on your username or create a new user with programmatic access.
5. Under the **Security credentials** tab, create a new access key.
6. Download the access key and secret key or securely copy them for use in the `terraform.tfvars` file.

## Running Terraform

1. Initialize the Terraform project:

   ```bash
   terraform init
   ```

2. Preview the changes Terraform will make:

   ```bash
   terraform plan
   ```

3. Apply the configuration to create the resources:

   ```bash
   terraform apply
   ```

   Type `yes` when prompted to confirm.

## Best Practices

1. **Protect Sensitive Information**: Add `terraform.tfvars` to `.gitignore` to prevent accidental commits of sensitive data.

   ```bash
   echo "terraform.tfvars" >> .gitignore
   ```

2. **Use Environment Variables**: For additional security, consider exporting AWS credentials as environment variables instead of hardcoding them in the `terraform.tfvars` file:
   ```bash
   export AWS_ACCESS_KEY_ID=<YOUR_AWS_ACCESS_KEY>
   export AWS_SECRET_ACCESS_KEY=<YOUR_AWS_SECRET_KEY>
   ```
   Update your Terraform provider configuration to:
   ```hcl
   provider "aws" {
     region = "us-east-1"
   }
   ```

## Cleaning Up

To destroy all resources created by Terraform, run:

```bash
terraform destroy
```

Type `yes` when prompted to confirm.

## Support

For issues or questions, please open an issue in this repository.
