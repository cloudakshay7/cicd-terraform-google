# Create a Compute Engine instance
resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = "e2-medium"
  zone         = var.zone

  # Boot disk
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Network interface
  network_interface {
    network       = "default"
    access_config {
      # Ephemeral public IP
    }
  }

  # Metadata (optional startup script)
  metadata_startup_script = <<-EOT
    #!/bin/bash
    echo "Hello from Terraform!" > /var/tmp/hello.txt
  EOT

  tags = ["terraform", "demo"]
}
