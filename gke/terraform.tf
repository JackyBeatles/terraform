terraform {
  backend "gcs" {
    credentials = "./terraform-gke-keyfile.json"
    bucket      = "gke-lab-cicd"
    prefix      = "terraform/state"
  }
}