variable "project" {
  description = "Project name."
  type        = string

  validation {
    condition     = length(var.project) > 0
    error_message = "project must not be empty."
  }
}

variable "environment" {
  description = "Environment name, for example dev or prod."
  type        = string

  validation {
    condition     = length(var.environment) > 0
    error_message = "environment must not be empty."
  }
}

variable "separator" {
  description = "Text placed between the project and the environment."
  type        = string
  default     = "-"
}
