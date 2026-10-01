variable "name" {
  description = "Who to greet."
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "name must not be empty."
  }
}

variable "prefix" {
  description = "Word that starts the greeting, such as Hello."
  type        = string
  default     = "Hello"
}
