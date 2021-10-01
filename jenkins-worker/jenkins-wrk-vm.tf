// Create VM for Ansible client
// Configure the Google Cloud provider

variable "project_id" {
  type = string
  default = "vast-pad-319812"
}
variable "region" {
  type = string
  default = "asia-south1"
}
provider "google" {
 credentials = file("/home/piseg432/keys/gce-creator.json")
// credentials =  $(GOOGLE_CLOUD_KEYFILE_JSON)
 //project     = "vast-pad-31912"
 project     = var.project_id
  region      = var.region
}

# We create a public IP address for our google compute instance to utilize
/* resource "google_compute_address" "static" {
  name = "vm-public-address"
  project = var.project_id
  region = var.region
//  depends_on = [ google_compute_firewall.firewall ]
} */
// A single Compute Engine instance

