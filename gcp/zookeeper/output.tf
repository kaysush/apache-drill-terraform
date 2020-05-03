output "zookeeper_hostname"{
    value = google_compute_instance.zookeeper.name
    description = "Hostname for Zookeeper."
}