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

  depends_on = [
    google_container_cluster.gke_cluster
  ]
}

# ------------------------------
# Node Pool secondaire (plus grand disque et machine)
# ------------------------------
resource "google_container_node_pool" "secondary_pool" {
  name       = "${var.cluster_name}-secondary-pool"
  cluster    = google_container_cluster.gke_cluster.name
  location   = var.zone

  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    machine_type = "e2-standard-4"  # plus CPU/RAM
    disk_size_gb = 100               # disque plus grand

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  depends_on = [
    google_container_cluster.gke_cluster
  ]
}