variable "gcp_project" {
  description = "Name of GCP project"
  default = "scb-api-payment"
}
variable "region" {
  default = "asia-southeast1"
}
variable "zone" {
  default = "asia-southeast1-b"
}
variable "machine_type" {
  description = "GCP machine type"
  default = "n1-standard-1"
}
variable "instance_name" {
  description = "GCP instance name"
  # type = "list"
  default = "cicd-lab-k8s-master,cicd-lab-k8s-node01,cicd-lab-k8s-node02"
}
variable "image" {
  description = "GCP Image name"
  default = "ubuntu-1604-xenial-v20190913"
}

variable "startup_script" {
  description = "A startup script passed as metadata"
  default = "touch /tmp/default_startup_script"
}
variable "node_count" {
  default = "3"
}