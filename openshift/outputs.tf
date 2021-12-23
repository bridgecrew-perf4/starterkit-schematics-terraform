output "ClusterODF" {
  value       = ibm_container_vpc_cluster.cluster[0].id
  description = "Id del Cluster con ODF"
}