provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source          = "../modules/app"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  machine_type    = "${var.machine_type}"
  user_ssh        = "${var.user_ssh}"
  xenial_image    = "${var.xenial_image}"
  network         = "${var.network}"
}

module "db" {
  source          = "../modules/db"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  focal_image     = "${var.focal_image}"
  machine_type    = "${var.machine_type}"
  user_ssh        = "${var.user_ssh}"
  network         = "${var.network}"
}

module "vpc" {
  source = "../modules/vpc"
  network       = "${var.network}"
  region        = "${var.region}"
  net_ip_ranges = "${var.net_ip_ranges}"
}
