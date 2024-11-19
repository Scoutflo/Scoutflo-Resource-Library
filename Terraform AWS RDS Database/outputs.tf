output "instance_id" {
  value       = join("", aws_db_instance.default[*].identifier)
  description = "ID of the instance"
}

output "instance_arn" {
  value       = join("", aws_db_instance.default[*].arn)
  description = "ARN of the instance"
}

output "instance_address" {
  value       = join("", aws_db_instance.default[*].address)
  description = "Address of the instance"
}

output "instance_endpoint" {
  value       = join("", aws_db_instance.default[*].endpoint)
  description = "DNS Endpoint of the instance"
}

output "subnet_group_id" {
  value       = join("", aws_db_subnet_group.default[*].id)
  description = "ID of the created Subnet Group"
}

output "security_group_id" {
  value       = join("", aws_security_group.default[*].id)
  description = "ID of the Security Group"
}

output "parameter_group_id" {
  value       = join("", aws_db_parameter_group.default[*].id)
  description = "ID of the Parameter Group"
}

output "option_group_id" {
  value       = join("", aws_db_option_group.default[*].id)
  description = "ID of the Option Group"
}

output "hostname" {
  value       = module.dns_host_name.hostname
  description = "DNS host name of the instance"
}

output "resource_id" {
  value       = join("", aws_db_instance.default[*].resource_id)
  description = "The RDS Resource ID of this instance."
}

output "master_user_secret" {
  value       = one(aws_db_instance.default[*].master_user_secret)
  description = "Secret object if configured with `var.database_manage_master_user_password = true`."
}

output "instance_class" {
  value       = join("", aws_db_instance.default[*].instance_class)
  description = "Class of the DB instance"
}

output "instance_status" {
  value       = join("", aws_db_instance.default[*].status)
  description = "Current status of the DB instance"
}

output "engine" {
  value       = join("", aws_db_instance.default[*].engine)
  description = "Database engine used"
}

output "availability_zone" {
  value       = join("", aws_db_instance.default[*].availability_zone)
  description = "Availability zone of the DB instance"
}

output "current_connections" {
  value       = aws_db_instance.default[0].current_connections # Assuming this is available
  description = "Current number of connections to the DB instance"
}

# Additional Outputs
output "backup_retention_period" {
  value       = aws_db_instance.default[0].backup_retention_period
  description = "Backup retention period in days."
}

output "maintenance_window" {
  value       = aws_db_instance.default[0].preferred_maintenance_window
  description = "Preferred maintenance window for the DB instance."
}

output "db_parameter_group" {
  value       = aws_db_instance.default[0].db_parameter_group_name
  description = "Name of the DB parameter group associated with the DB instance."
}

output "db_option_group" {
  value       = aws_db_instance.default[0].db_option_group_name
  description = "Name of the DB option group associated with the DB instance."
}

output "iam_database_authentication" {
  value       = aws_db_instance.default[0].iam_database_authentication_enabled
  description = "Indicates if IAM database authentication is enabled."
}

output "vpc_security_groups" {
  value       = aws_db_instance.default[0].vpc_security_group_ids
  description = "List of VPC security groups associated with the DB instance."
}

# Tags Output (if applicable)
output "tags" {
  value       = aws_db_instance.default[0].tags
  description = "Tags associated with the DB instance."
}