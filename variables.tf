variable "compute_instance_iam_members" {
  description = <<EOT
Map of compute_instance_iam_members, attributes below
Required:
    - instance_name
    - member
    - role
Optional:
    - project
    - zone
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    instance_name = string
    member        = string
    role          = string
    project       = optional(string)
    zone          = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

