resource "aws_db_instance" "mysql" {
  identifier             = "${var.project_name}-db"
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
 db_name                 = "ecommercedb"
  username               = "admin"
  password               = "SuperSecure123"
  skip_final_snapshot    = true
  publicly_accessible    = true
}
