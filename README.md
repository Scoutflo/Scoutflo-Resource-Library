# **Terraform AWS Resource Library**

WIP

Create and manage AWS resources seamlessly using Terraform templates from this repository. Each template is designed to help you deploy AWS infrastructure efficiently and follows Terraform best practices.

## **Overview**
This repository contains a curated collection of Terraform code templates to create various AWS resources. These templates are designed to be modular and reusable, enabling you to set up AWS infrastructure quickly and reliably.

### **Features**
- Comprehensive templates for common AWS resources.
- Modular and reusable code for scalability and flexibility.
- Easy-to-follow examples for both beginners and advanced users.
- Compatible with the latest Terraform and AWS provider versions.

---

## **Available Templates**

| **Resource**                       | **Description**                                                                 |
|------------------------------------|---------------------------------------------------------------------------------|
| **[AWS ALB](templates/alb)**       | Set up an Application Load Balancer with listeners, target groups, and rules.  |
| **[AWS API Gateway](templates/apigateway)** | Deploy RESTful APIs or WebSocket APIs.                                         |
| **[AWS Lambda](templates/lambda)** | Provision Lambda functions with execution roles and triggers.                  |
| **[AWS Load Balancers](templates/lb)** | Create Application, Network, or Classic Load Balancers.                        |
| **[AWS DynamoDB](templates/dynamodb)** | Provision DynamoDB tables with auto-scaling and TTL configurations.            |
| **[AWS EC2](templates/ec2)**       | Launch and manage EC2 instances with security groups and EBS volumes.          |
| **[AWS ECR](templates/ecr)**       | Set up Elastic Container Registry for container images.                        |
| **[AWS IAM Roles](templates/iamrole)** | Create IAM roles, policies, and permissions.                                   |
| **[AWS Node Groups](templates/nodegroup)** | Manage Kubernetes node groups for EKS clusters.                               |
| **[AWS RDS](templates/rds)**       | Deploy and manage relational databases (MySQL, PostgreSQL, etc.).              |
| **[AWS Route53](templates/route53)** | Configure DNS zones and records for your domains.                              |
| **[AWS S3 Bucket](templates/s3)**  | Create S3 buckets with versioning, encryption, and lifecycle policies.         |
| **[AWS SQS](templates/sqs)**       | Set up Simple Queue Service for message queuing.                               |
| **[AWS SSM Patch](templates/ssm)** | Automate patch management using AWS Systems Manager.                           |
| **[AWS VPC](templates/vpc)**       | Build Virtual Private Clouds with subnets, route tables, and gateways.         |
| **[AWS VPN](templates/vpn)**       | Set up secure VPN connections to your on-premises networks.                    |
| **[ECS Cluster](templates/ecs)**   | Deploy and manage Elastic Container Service clusters.                          |
| **[AWS Utils](templates/utils)**   | Additional helper templates for AWS services.                                  |

---

## **How to Use**
1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo-name.git
   ```
2. Navigate to the desired template directory:
   ```bash
   cd templates/<resource-name>
   ```
3. Review and customize the variables in the `variables.tf` file to suit your use case.
4. Initialize Terraform:
   ```bash
   terraform init
   ```
5. Plan the infrastructure:
   ```bash
   terraform plan
   ```
6. Apply the changes to deploy your resource:
   ```bash
   terraform apply
   ```

---

## **Prerequisites**
- **Terraform:** Ensure you have Terraform installed. You can download it [here](https://www.terraform.io/downloads.html).
- **AWS CLI:** Install and configure the AWS CLI with your credentials. Follow the guide [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).
- **IAM Permissions:** Ensure you have the necessary permissions to create and manage AWS resources.

---

## **Contributing**
We welcome contributions! If you have additional templates or improvements, feel free to:
1. Fork the repository.
2. Create a new branch.
3. Submit a pull request.

---

## **License**
This project is licensed under the [MIT License](LICENSE).

---

## **Support**
If you encounter any issues or have questions, feel free to open an issue in this repository or contact the maintainer.

---