variable "location" {
  type        = string
  description = "The location for deployment"
  default     = "West Europe"
}

variable "rsgname" {
  type        = string
  description = "Resource Group name"
  default     = "example2-resources"
}

variable "srname" {
  description = "Storage account name"
  type        = string
  default     = null
}