variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable machine_type {
  description = "Machine type for reddit db"
  default     = "g1-small"
}

variable firewall_ports {
  description = "Port of the firewall rule"
  default     = ["27017"]
}
