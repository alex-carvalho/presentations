
```shell
$ checkov  --file main.tf
```

```log
Check: CKV_AWS_46: "Ensure no hard-coded secrets exist in EC2 user data"
        PASSED for resource: aws_instance.problematic_ec2
        File: /main.tf:8-20
        Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/secrets-policies/bc-aws-secrets-1
Check: CKV_AWS_88: "EC2 instance should not have public IP."
        FAILED for resource: aws_instance.problematic_ec2
        File: /main.tf:8-20
        Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/public-policies/public-12
                8  | resource "aws_instance" "problematic_ec2" {
                9  |   # Missing required ami - terraform validate will catch this
                10 |   instance_type = var.instance_type
                12 |   associate_public_ip_address = true   # Checkov will flag this as a security issue
                14 |   root_block_device {
                15 |     encrypted = false # Checkov will flag unencrypted volumes
                16 |     volume_size = 100 
                17 |   }  
                19 |   vpc_security_group_ids = [aws_security_group.wide_open.id] # Security group with all ports open - Checkov will flag this
                20 | }

Check: CKV_AWS_126: "Ensure that detailed monitoring is enabled for EC2 instances"
        FAILED for resource: aws_instance.problematic_ec2 File: /main.tf:8-20
Check: CKV_AWS_135: "Ensure that EC2 is EBS optimized"
        FAILED for resource: aws_instance.problematic_ec2 File: /main.tf:8-20
Check: CKV_AWS_8: "Ensure all data stored in the Launch configuration or instance Elastic Blocks Store is securely encrypted"
        FAILED for resource: aws_instance.problematic_ec2 File: /main.tf:8-20
Check: CKV_AWS_260: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 80"
        FAILED for resource: aws_security_group.wide_open File: /main.tf:23-34
```
