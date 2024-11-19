variable "use_fullname" {
  type        = bool
  default     = true
  description = "Set 'true' to use `namespace-stage-name` for ecr repository name, else `name`"
}

variable "principals_full_access" {
  type        = list(string)
  description = "Principal ARNs to provide with full access to the ECR"
  default     = []
}

variable "principals_push_access" {
  type        = list(string)
  description = "Principal ARNs to provide with push access to the ECR"
  default     = []
}

variable "principals_readonly_access" {
  type        = list(string)
  description = "Principal ARNs to provide with readonly access to the ECR"
  default     = []
}

variable "principals_pull_though_access" {
  type        = list(string)
  description = "Principal ARNs to provide with pull though access to the ECR"
  default     = []
}

variable "principals_lambda" {
  type        = list(string)
  description = "Principal account IDs of Lambdas allowed to consume ECR"
  default     = []
}

variable "scan_images_on_push" {
  type        = bool
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not (false)"
  default     = true
}

variable "max_image_count" {
  type        = number
  description = "How many Docker Image versions AWS ECR will store"
  default     = 500
}

variable "time_based_rotation" {
  type        = bool
  description = "Set to true to filter image based on the `sinceImagePushed` count type."
  default     = false
}

variable "image_names" {
  type        = list(string)
  default     = ["atharvatestecr1", "atharvatestecr2", "atharvatestecr3"]
  description = "List of Docker local image names, used as repository names for AWS ECR "
}

variable "image_tag_mutability" {
  type        = string
  default     = "IMMUTABLE"
  description = "The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE`"
}

variable "enable_lifecycle_policy" {
  type        = bool
  description = "Set to false to prevent the module from adding any lifecycle policies to any repositories"
  default     = true
}

variable "protected_tags" {
  type        = set(string)
  description = "List of image tags prefixes and wildcards that should not be destroyed. Useful if you tag images with prefixes like `dev`, `staging`, `prod` or wildcards like `*dev`, `*prod`,`*.*.*`"
  default     = []
}

variable "protected_tags_keep_count" {
  type        = number
  description = "Number of Image versions to keep for protected tags"
  default     = 999999
}

variable "encryption_configuration" {
  type = object({
    encryption_type = string
    kms_key         = any
  })
  description = "ECR encryption configuration"
  default     = null
}

variable "force_delete" {
  type        = bool
  description = "Whether to delete the repository even if it contains images"
  default     = false
}

variable "replication_configurations" {
  description = "Replication configuration for a registry."
  type = list(object({
    rules = list(object({
      destinations = list(object({
        region      = string        # Destination region for replication
        registry_id = string        # AWS Account ID of the destination registry
      }))
      repository_filters = list(object({
        filter      = string        # Prefix for filtering which repositories to replicate
        filter_type = string        # Should be "PREFIX_MATCH"
      }))
    }))
  }))

  default = [
    {
      rules = [
        {
          destinations = [
            {
              region      = "us-east-1"   # Example destination region
              registry_id = "891376929531" # Replace with actual AWS Account ID
            },
            {
              region      = "us-west-1"   # Another example destination region
              registry_id = "891376929531" # Same account ID or another if cross-account
            }
          ]
          repository_filters = [
            {
              filter      = "my-repo-prefix/*"  # Adjust as needed
              filter_type = "PREFIX_MATCH"       # Correct filter type
            }
          ]
        }
      ]
    }
  ]
}


variable "organizations_readonly_access" {
  type        = list(string)
  description = "Organization IDs to provide with readonly access to the ECR."
  default     = []
}

variable "organizations_full_access" {
  type        = list(string)
  description = "Organization IDs to provide with full access to the ECR."
  default     = []
}

variable "organizations_push_access" {
  type        = list(string)
  description = "Organization IDs to provide with push access to the ECR"
  default     = []
}

variable "prefixes_pull_through_repositories" {
  type        = list(string)
  description = "Organization IDs to provide with push access to the ECR"
  default     = []
}
