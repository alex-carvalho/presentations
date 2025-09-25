
```shell
$ terraform validate
```

``` log
╷
│ Error: Missing required argument
│ 
│   with aws_instance.problematic_ec2,
│   on main.tf line 8, in resource "aws_instance" "problematic_ec2":
│    8: resource "aws_instance" "problematic_ec2" {
│ 
│ "ami": one of `ami,launch_template` must be specified
```
