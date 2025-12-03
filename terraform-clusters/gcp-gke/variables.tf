variable "project_id" {
  description = "ID du projet GCP"
  type        = string
}

variable "region" {
  description = "Région GCP"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone GCP"
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "Nom du cluster GKE"
  type        = string
  default     = "mon-cluster"
}

variable "machine_type" {
  description = "Type de machine pour les nodes"
  type        = string
  default     = "e2-medium"
}

variable "disk_size" {
  description = "Taille du disque des nodes"
  type        = number
  default     = 40
}

variable "min_nodes" {
  description = "Minimum de nodes"
  type        = number
  default     = 2
}

variable "max_nodes" {
  description = "Maximum de nodes"
  type        = number
  default     = 5
}

variable "initial_nodes" {
  description = "Nombre initial de nodes"
  type        = number
  default     = 2
}
