variable "repos" {
  description = "0 out of 256 characters maximum (2 minimum). The name must start with a letter and can only contain lowercase letters, numbers, hyphens, underscores, and forward slashes."
  type        = list(string)
  default     = [] # Please insert the repository names, then run the script.
}

variable "max_image_count" {
  description = "How many Docker Image versions AWS ECR will store."
  type        = number
  default     = 20
}

variable "protected_tags" {
  type        = set(string)
  description = "Name of image tags prefixes that should not be destroyed. Useful if you tag images with names like `dev`, `staging`, and `prod`"
  default     = []
}
