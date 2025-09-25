
```shell
$ checkov  --file main.tf
```

```log
[ terraform framework ]: 100%|████████████████████|[1/1], Current File Scanned=main.tf
[ secrets framework ]: 100%|████████████████████|[1/1], Current File Scanned=main.tf
[ secrets framework ]:   0%|                    |[0/1], Current File Scanned=main.tf
       _               _
   ___| |__   ___  ___| | _______   __
  / __| '_ \ / _ \/ __| |/ / _ \ \ / /
 | (__| | | |  __/ (__|   < (_) \ V /
  \___|_| |_|\___|\___|_|\_\___/ \_/

By Prisma Cloud | version: 3.2.471 

terraform scan results:

Passed checks: 3, Failed checks: 11, Skipped checks: 0

Check: CKV_AWS_46: "Ensure no hard-coded secrets exist in EC2 user data"
	PASSED for resource: aws_instance.problematic_ec2
	File: /main.tf:8-20
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/secrets-policies/bc-aws-secrets-1
Check: CKV_AWS_382: "Ensure no security groups allow egress from 0.0.0.0:0 to port -1"
	PASSED for resource: aws_security_group.wide_open
	File: /main.tf:23-34
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-networking-policies/bc-aws-382
Check: CKV2_AWS_5: "Ensure that Security Groups are attached to another resource"
	PASSED for resource: aws_security_group.wide_open
	File: /main.tf:23-34
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-networking-policies/ensure-that-security-groups-are-attached-to-ec2-instances-or-elastic-network-interfaces-enis
Check: CKV_AWS_79: "Ensure Instance Metadata Service Version 1 is not enabled"
	FAILED for resource: aws_instance.problematic_ec2
	File: /main.tf:8-20
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/bc-aws-general-31

		8  | resource "aws_instance" "problematic_ec2" {
		9  |   # Missing required ami - terraform validate will catch this
		10 |   instance_type = var.instance_type
		11 |   
		12 |   associate_public_ip_address = true   # Checkov will flag this as a security issue
		13 | 
		14 |   root_block_device {
		15 |     encrypted = false # Checkov will flag unencrypted volumes
		16 |     volume_size = 100 
		17 |   }  
		18 |   
		19 |   vpc_security_group_ids = [aws_security_group.wide_open.id] # Security group with all ports open - Checkov will flag this
		20 | }

Check: CKV_AWS_88: "EC2 instance should not have public IP."
	FAILED for resource: aws_instance.problematic_ec2
	File: /main.tf:8-20
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/public-policies/public-12

		8  | resource "aws_instance" "problematic_ec2" {
		9  |   # Missing required ami - terraform validate will catch this
		10 |   instance_type = var.instance_type
		11 |   
		12 |   associate_public_ip_address = true   # Checkov will flag this as a security issue
		13 | 
		14 |   root_block_device {
		15 |     encrypted = false # Checkov will flag unencrypted volumes
		16 |     volume_size = 100 
		17 |   }  
		18 |   
		19 |   vpc_security_group_ids = [aws_security_group.wide_open.id] # Security group with all ports open - Checkov will flag this
		20 | }

Check: CKV_AWS_126: "Ensure that detailed monitoring is enabled for EC2 instances"
	FAILED for resource: aws_instance.problematic_ec2
	File: /main.tf:8-20
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-logging-policies/ensure-that-detailed-monitoring-is-enabled-for-ec2-instances

		8  | resource "aws_instance" "problematic_ec2" {
		9  |   # Missing required ami - terraform validate will catch this
		10 |   instance_type = var.instance_type
		11 |   
		12 |   associate_public_ip_address = true   # Checkov will flag this as a security issue
		13 | 
		14 |   root_block_device {
		15 |     encrypted = false # Checkov will flag unencrypted volumes
		16 |     volume_size = 100 
		17 |   }  
		18 |   
		19 |   vpc_security_group_ids = [aws_security_group.wide_open.id] # Security group with all ports open - Checkov will flag this
		20 | }

Check: CKV_AWS_135: "Ensure that EC2 is EBS optimized"
	FAILED for resource: aws_instance.problematic_ec2
	File: /main.tf:8-20
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/ensure-that-ec2-is-ebs-optimized

		8  | resource "aws_instance" "problematic_ec2" {
		9  |   # Missing required ami - terraform validate will catch this
		10 |   instance_type = var.instance_type
		11 |   
		12 |   associate_public_ip_address = true   # Checkov will flag this as a security issue
		13 | 
		14 |   root_block_device {
		15 |     encrypted = false # Checkov will flag unencrypted volumes
		16 |     volume_size = 100 
		17 |   }  
		18 |   
		19 |   vpc_security_group_ids = [aws_security_group.wide_open.id] # Security group with all ports open - Checkov will flag this
		20 | }

Check: CKV_AWS_8: "Ensure all data stored in the Launch configuration or instance Elastic Blocks Store is securely encrypted"
	FAILED for resource: aws_instance.problematic_ec2
	File: /main.tf:8-20
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/general-13

		8  | resource "aws_instance" "problematic_ec2" {
		9  |   # Missing required ami - terraform validate will catch this
		10 |   instance_type = var.instance_type
		11 |   
		12 |   associate_public_ip_address = true   # Checkov will flag this as a security issue
		13 | 
		14 |   root_block_device {
		15 |     encrypted = false # Checkov will flag unencrypted volumes
		16 |     volume_size = 100 
		17 |   }  
		18 |   
		19 |   vpc_security_group_ids = [aws_security_group.wide_open.id] # Security group with all ports open - Checkov will flag this
		20 | }

Check: CKV_AWS_260: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 80"
	FAILED for resource: aws_security_group.wide_open
	File: /main.tf:23-34
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-networking-policies/ensure-aws-security-groups-do-not-allow-ingress-from-00000-to-port-80

		23 | resource "aws_security_group" "wide_open" {
		24 |   name        = "allow_all"
		25 |   description = "Allow all inbound traffic"
		26 | 
		27 |   # Dangerous ingress rule - Checkov will flag this
		28 |   ingress {
		29 |     from_port   = 0
		30 |     to_port     = 0
		31 |     protocol    = "-1"
		32 |     cidr_blocks = ["0.0.0.0/0"]
		33 |   }
		34 | }
Check: CKV_AWS_24: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 22"
	FAILED for resource: aws_security_group.wide_open
	File: /main.tf:23-34
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-networking-policies/networking-1-port-security

		23 | resource "aws_security_group" "wide_open" {
		24 |   name        = "allow_all"
		25 |   description = "Allow all inbound traffic"
		26 | 
		27 |   # Dangerous ingress rule - Checkov will flag this
		28 |   ingress {
		29 |     from_port   = 0
		30 |     to_port     = 0
		31 |     protocol    = "-1"
		32 |     cidr_blocks = ["0.0.0.0/0"]
		33 |   }
		34 | }
Check: CKV_AWS_23: "Ensure every security group and rule has a description"
	FAILED for resource: aws_security_group.wide_open
	File: /main.tf:23-34
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-networking-policies/networking-31

		23 | resource "aws_security_group" "wide_open" {
		24 |   name        = "allow_all"
		25 |   description = "Allow all inbound traffic"
		26 | 
		27 |   # Dangerous ingress rule - Checkov will flag this
		28 |   ingress {
		29 |     from_port   = 0
		30 |     to_port     = 0
		31 |     protocol    = "-1"
		32 |     cidr_blocks = ["0.0.0.0/0"]
		33 |   }
		34 | }
Check: CKV_AWS_277: "Ensure no security groups allow ingress from 0.0.0.0:0 to port -1"
	FAILED for resource: aws_security_group.wide_open
	File: /main.tf:23-34
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-networking-policies/ensure-aws-security-group-does-not-allow-all-traffic-on-all-ports

		23 | resource "aws_security_group" "wide_open" {
		24 |   name        = "allow_all"
		25 |   description = "Allow all inbound traffic"
		26 | 
		27 |   # Dangerous ingress rule - Checkov will flag this
		28 |   ingress {
		29 |     from_port   = 0
		30 |     to_port     = 0
		31 |     protocol    = "-1"
		32 |     cidr_blocks = ["0.0.0.0/0"]
		33 |   }
		34 | }
Check: CKV_AWS_25: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 3389"
	FAILED for resource: aws_security_group.wide_open
	File: /main.tf:23-34
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-networking-policies/networking-2

		23 | resource "aws_security_group" "wide_open" {
		24 |   name        = "allow_all"
		25 |   description = "Allow all inbound traffic"
		26 | 
		27 |   # Dangerous ingress rule - Checkov will flag this
		28 |   ingress {
		29 |     from_port   = 0
		30 |     to_port     = 0
		31 |     protocol    = "-1"
		32 |     cidr_blocks = ["0.0.0.0/0"]
		33 |   }
		34 | }
Check: CKV2_AWS_41: "Ensure an IAM role is attached to EC2 instance"
	FAILED for resource: aws_instance.problematic_ec2
	File: /main.tf:8-20
	Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-iam-policies/ensure-an-iam-role-is-attached-to-ec2-instance

		8  | resource "aws_instance" "problematic_ec2" {
		9  |   # Missing required ami - terraform validate will catch this
		10 |   instance_type = var.instance_type
		11 |   
		12 |   associate_public_ip_address = true   # Checkov will flag this as a security issue
		13 | 
		14 |   root_block_device {
		15 |     encrypted = false # Checkov will flag unencrypted volumes
		16 |     volume_size = 100 
		17 |   }  
		18 |   
		19 |   vpc_security_group_ids = [aws_security_group.wide_open.id] # Security group with all ports open - Checkov will flag this
		20 | }

```
