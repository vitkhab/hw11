resource "google_compute_firewall" "firewall_ssh" {
  name        = "default-allow-ssh"
  network     = "default"
  description = "Allow SSH connection"

  allow {
    protocol = "tcp"
    ports    = "${var.firewall_ports}"
  }

  source_ranges = "${var.firewall_source_ranges}"
}
