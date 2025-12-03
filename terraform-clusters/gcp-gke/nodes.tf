resource "google_container_node_pool" "default_pool" {
  name       = "${var.cluster_name}-pool"
  cluster    = google_container_cluster.gke_cluster.name
  location   = var.zone

  node_count = var.initial_nodes

  autoscaling {
    min_node_count = var.min_nodes
    max_node_count = var.max_nodes
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
