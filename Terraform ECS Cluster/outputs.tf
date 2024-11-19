################################################################################
# ECS Cluster Outputs
################################################################################

# Output the full ECS cluster object for advanced use cases
output "cluster" {
  description = "All outputs of the 'aws_ecs_cluster' resource."
  value       = try(aws_ecs_cluster.cluster[0], {})
}

# Cluster ARN
output "cluster_arn" {
  description = "The ARN of the ECS cluster"
  value       = try(aws_ecs_cluster.cluster[0].arn, null)
}

# Cluster Name
output "cluster_name" {
  description = "The name of the ECS cluster"
  value       = try(aws_ecs_cluster.cluster[0].name, null)
}

# Cluster Status (Remove or replace with a valid attribute)
output "cluster_status" {
  description = "The current status of the ECS cluster (e.g., ACTIVE)"
  value       = null  # or remove this output entirely if not needed
}

# Registered Container Instances Count (Remove or replace with a valid attribute)
output "registered_container_instances_count" {
  description = "The number of container instances registered in the cluster"
  value       = null  # or remove this output entirely if not needed
}

# Active Services Count (Remove or replace with a valid attribute)
output "active_services_count" {
  description = "The number of services running in the cluster"
  value       = null  # or remove this output entirely if not needed
}

# Running Tasks Count (Remove or replace with a valid attribute)
output "running_tasks_count" {
  description = "The number of tasks running in the cluster"
  value       = null  # or remove this output entirely if not needed
}

# Capacity Providers
output "capacity_providers" {
  description = "The capacity providers associated with the ECS cluster"
  value       = try(aws_ecs_cluster.cluster[0].capacity_providers, [])
}

# Default Capacity Provider Strategy
output "default_capacity_provider_strategy" {
  description = "The default capacity provider strategy for the cluster"
  value       = try(aws_ecs_cluster.cluster[0].default_capacity_provider_strategy, [])
}

# Tags
output "cluster_tags" {
  description = "Tags associated with the ECS cluster"
  value       = try(aws_ecs_cluster.cluster[0].tags, {})
}