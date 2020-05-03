resource "google_compute_instance" "zookeeper" { 
  name = "zookeeper-${var.random_suffix}"
  machine_type = var.machine_type
  zone = var.zone

  boot_disk{
      initialize_params {
          image = "${var.image_project}/${var.image_family}"
      }
  }

  metadata_startup_script = var.metadata_startup_script

   service_account {
    scopes = ["compute-ro", "storage-ro"]
  }
  
  network_interface{
      network = var.network

      access_config{

      }
  }

  tags = ["zookeeper"]
}