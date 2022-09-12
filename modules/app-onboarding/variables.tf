variable "aws_secret_backend_path" {
  type = string
}

# variable "gitlab_hostname" {
#   type = string
# }

variable "gitlab_jwt_path" {
  type = string
}

# variable "gitlab_runner_default_policy" {
#   type = string
#   default = "gitlab_runner_default_policy"
# }

# variable "gitlab_runner_jwt_role" {
#   type = string
#   default = "gitlab_runner_jwt_role"
# }


variable "asset_ids" {
  description = "A set of asset_ids to onbaord"
}
