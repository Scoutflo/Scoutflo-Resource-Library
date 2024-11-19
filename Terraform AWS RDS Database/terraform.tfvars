# Basic Instance Configuration
instance_class = "db.t3.micro"
allocated_storage = 20
storage_type = "gp2"
engine = "mysql"
engine_version = "8.0.40"

# Database Configuration
database_name = "testdb"
database_user = "admin"
database_password = "YourSecurePassword123!"
database_port = 3306

# Network Configuration
vpc_id = "vpc-029ba07051fb831c8"  # Replace with your VPC ID
subnet_ids = [
  "subnet-0b75500d968a7018c",     # Replace with your subnet IDs
  "subnet-098f4f85adb631b01"
]
allowed_cidr_blocks = ["10.0.0.0/16"]

# Backup and Maintenance
backup_retention_period = 7
backup_window = "22:00-03:00"
maintenance_window = "Mon:03:00-Mon:04:00"

# Performance and Storage
multi_az = false
publicly_accessible = false
storage_encrypted = true
db_parameter_group = "mysql8.0"

# Other Settings
skip_final_snapshot = true
deletion_protection = false
auto_minor_version_upgrade = true
allow_major_version_upgrade = false

# Monitoring
monitoring_interval = "0"
performance_insights_enabled = false