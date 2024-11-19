################################################################################
# Queue
################################################################################

output "queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.this[0].id, null)
}

output "queue_arn" {
  description = "The ARN of the SQS queue"
  value       = try(aws_sqs_queue.this[0].arn, null)
}

output "queue_arn_static" {
  description = "The ARN of the SQS queue. Use this to avoid cycle errors between resources (e.g., Step Functions)"
  value       = var.create && !var.use_name_prefix ? "arn:aws:sqs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${local.name}" : ""
}

output "queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.this[0].url, null)
}

output "queue_name" {
  description = "The name of the SQS queue"
  value       = try(aws_sqs_queue.this[0].name, null)
}

output "queue_type" {
  description = "The type of the SQS queue (Standard or FIFO)"
  value       = try(aws_sqs_queue.this[0].fifo_queue ? "FIFO" : "Standard", "Standard")
}

output "queue_encryption" {
  description = "The KMS key used for server-side encryption of the SQS queue"
  value       = try(aws_sqs_queue.this[0].kms_master_key_id, "Amazon SQS key (SSE-SQS)")
}

################################################################################
# Dead Letter Queue
################################################################################

output "dead_letter_queue_id" {
  description = "The URL for the created Amazon SQS DLQ"
  value       = try(aws_sqs_queue.dlq[0].id, null)
}

output "dead_letter_queue_arn" {
  description = "The ARN of the SQS DLQ"
  value       = try(aws_sqs_queue.dlq[0].arn, null)
}

output "dead_letter_queue_arn_static" {
  description = "The ARN of the SQS DLQ. Use this to avoid cycle errors between resources (e.g., Step Functions)"
  value       = var.create && var.create_dlq && !var.use_name_prefix ? "arn:aws:sqs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${local.dlq_name}" : ""
}

output "dead_letter_queue_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS DLQ"
  value       = try(aws_sqs_queue.dlq[0].url, null)
}

output "dead_letter_queue_name" {
  description = "The name of the SQS DLQ"
  value       = try(aws_sqs_queue.dlq[0].name, null)
}

output "dead_letter_queue_encryption" {
  description = "The KMS key used for server-side encryption of the DLQ"
  value       = try(aws_sqs_queue.dlq[0].kms_master_key_id, "Amazon SQS key (SSE-SQS)")
}

################################################################################
# Monitoring and Tagging
################################################################################

output "queue_tags" {
  description = "The tags assigned to the SQS queue"
  value       = try(aws_sqs_queue.this[0].tags, {})
}

output "queue_monitoring_enabled" {
  description = "Indicates if monitoring metrics are enabled for the queue"
  value       = false
}
