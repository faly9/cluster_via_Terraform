resource "kubernetes_namespace" "freelance" {
  metadata {
    name = "freelance"
  }

  depends_on = [
    google_container_node_pool.default_pool
  ]
}
