# Create a security group for RDS Database Instance
resource "aws_security_group" "rds_sg" {
  name = "rds_sg"

  # Allow MySQL access from any IP (0.0.0.0/0)
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from any IP address (use with caution)
  }

  # Allow all outbound traffic (adjust as needed)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "myinstance" {
  engine                 = "mysql"
  identifier             = "myrdsinstance"
  allocated_storage      = 20
  engine_version         = "8.0.39"       # MySQL version
  instance_class         = "db.t4g.micro" # EC2 instance class
  username               = var.rds_username
  password               = var.rds_password
  parameter_group_name   = "default.mysql8.0" # Correct version-specific parameter group
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = {
    Name = "MyRDSInstance"
  }
}

