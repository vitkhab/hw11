variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable machine_type {
  description = "Machine type for reddit app"
  default     = "g1-small"
}

variable firewall_ports {
  description = "Port of the firewall rule"
  default     = ["9292"]
}

variable firewall_source_ranges {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}
