resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "${var.machine_type}"
  zone         = "europe-west1-b"

  # определение тегов
  tags = ["reddit-app"]

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    access_config {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }

  metadata {
    sshKeys = "appuser:${file(var.public_key_path)}"
  }
}

# определение внешнего адресса в виде внешнего ресурса
resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"

  # Название сети, в которой действует правило
  network = "default"

  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = "${var.firewall_ports}"
  }

  # Каким адресам разрешаем доступ
  source_ranges = "${var.firewall_source_ranges}"

  # Правило применимо для инстансов с тегом …
  target_tags = ["reddit-app"]
}
