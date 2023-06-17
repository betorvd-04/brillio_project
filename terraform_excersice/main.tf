# provider "google" {
#   project = "<PROJECT_ID>"
#   region  = "<REGION>"
#   zone    = "<ZONE>"
# }

resource "google_storage_bucket" "bucket" {
  name     = var.storage_bucket_name # Sample name
  location = var.storage_bucket_loc
}
resource "google_storage_bucket_iam_binding" "bucket_read_only" {
  bucket  = google_storage_bucket.bucket.name
  role    = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}

resource "google_compute_network" "vpc_network" {
  name = var.vpc_name
}

resource "google_compute_subnetwork" "subnet-1" {
  name          = var.subnet_name_1
  ip_cidr_range = "172.16.0.10/32"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "subnet-2" {
  name          = var.subnet_name_2
  ip_cidr_range = "172.17.0.10/32"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "subnet-3" {
  name          = var.subnet_name_3
  ip_cidr_range = "172.18.0.10/32"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_firewall" "firewall" {
  name    = var.compute_firewall
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }
    source_tags = ["web"]
}

resource "google_compute_instance" "web-server-instance1" {
  name         = var.compute_instance_name1
  machine_type = "n1-standard-1"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.subnet-1.id
  }
}

resource "google_compute_instance" "web-server-instance2" {
  name         = var.compute_instance_name2
  machine_type = "n1-standard-1"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.subnet-2.id
  }
}

resource "google_compute_instance" "db-server-instance" {
  name         = var.compute_instance_db
  machine_type = "n1-standard-1"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.subnet-3.id
  }
}