resource "google_compute_subnetwork" "custom_subnet" {
  name          = "${var.network}"
  ip_cidr_range = "${var.net_ip_ranges}"
  region        = "${var.region}"
  network       = "default"
}

resource "google_compute_firewall" "firewall_ssh" {
  name        = "allow-ssh-${var.network}"
  description = "Allow SSH from anywhere"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = "${var.source_ranges}"
  priority      = "65534"
  target_tags   = ["default-ssh-allow"]
}

resource "google_compute_firewall" "default-allow-http" {
  name        = "allow-http-${var.network}"
  description = "Allow HTTP"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = "${var.source_ranges}"
  priority      = "65534"
  target_tags   = ["default-http-allow"]
}
