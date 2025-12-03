output "cluster_name" {
  description = "Nom du cluster GKE"
  value       = google_container_cluster.gke_cluster.name
}

output "kubernetes_endpoint" {
  description = "Endpoint du cluster"
  value       = google_container_cluster.gke_cluster.endpoint
}

output "node_pool" {
  description = "Nom du node pool"
  value       = google_container_node_pool.default_pool.name
}
