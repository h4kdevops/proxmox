variable "password" {
    type        = string
    default     = "rootsecure"
    description = "Password for the root user of the LXC container"
}
variable "ssh_public_keys" {
    type        = string
    default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM+6nqsVTrxjXhOHVWoWayn5M6bcGYRa9dtoLN0khdxM wsl"
    description = "Public SSH key to add to the LXC container"
}