variable "tenants" {
  type = map(string)
  default = {}
}
variable "kube_host" {}
variable "kube_client_certificate" {}
variable "kube_client_key" {}
variable "kube_cluster_ca_certificate" {}