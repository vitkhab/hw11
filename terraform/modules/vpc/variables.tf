variable firewall_source_ranges {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}

variable firewall_ports {
  description = "Port of the connection"
  default     = ["22"]
}
