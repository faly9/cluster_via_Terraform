resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }

  network    = "default"
  subnetwork = "default"
}

provider "kubernetes" {
  host                   = google_container_cluster.gke_cluster.endpoint
  cluster_ca_certificate = base64decode(google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}

resource "kubernetes_namespace" "freelance" {
  metadata {
    name = "freelance"
  }
}