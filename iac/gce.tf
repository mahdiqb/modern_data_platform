resource "google_compute_instance" "airbyte-instance" {
  name         = "airbyte-instance"
  machine_type = "e2-medium"

  tags = ["airbyte"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = 40
    }
  }

  network_interface {
    network = "default"
  }

  metadata_startup_script = file("${path.module}/init_scripts/airbyte.sh")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.airbyte-service-account.email
    scopes = ["cloud-platform"]
  }
}