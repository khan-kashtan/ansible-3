resource "google_compute_instance" "app" {
  metadata {
    ssh-keys = "${var.user_ssh}:${file(var.public_key_path)}"
  }

  name         = "${var.network}-app"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  tags         = ["reddit-app"]
  tags         = ["default-ssh-allow"]
  tags         = ["default-http-allow"]

  boot_disk {
    initialize_params {
      image = "${var.xenial_image}"
    }
  }

  network_interface {
    subnetwork = "${var.network}"

    access_config = {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }
}

resource "google_compute_address" "app_ip" {
  name = "reddit-ip-${var.network}"
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-${var.network}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
