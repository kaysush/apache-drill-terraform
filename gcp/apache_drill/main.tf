resource "google_compute_instance" "drill" { 
  count = var.instance_count
  name = "drill-${var.random_suffix}-${count.index + 1}"
  machine_type = var.machine_type
  zone = var.zone

  boot_disk{
      initialize_params {
          image = "${var.image_project}/${var.image_family}"
      }
  }

  metadata_startup_script = var.startup_script

   service_account {
    scopes = ["compute-ro", "storage-ro"]
  }
    
  network_interface{
      network = var.network

      access_config{

      }
  }
  tags = ["drill", "drill-machine-${count.index + 1}"]
}



