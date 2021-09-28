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
resource "google_compute_instance" "gcp-instance" {
 // name         = "prografana-poc-vm-${random_id.instance_id.hex}"
 name = "jenkins-mst-tf"
 machine_type = "e2-medium"
 zone         = "asia-south1-c"
 tags = ["allow-jenkins-8080-5000","http-server"]
  labels = {
    "purpose" = "poc"
    "preserve" = "no"
  }
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20210720"
    }
  }

// 
// metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync"
  metadata_startup_script = file("jenkins-config.sh")

 network_interface {
   network = "default"

   access_config {
     //nat_ip = google_compute_address.static.address
     }
  }
  metadata = {
   ssh-keys = "piseg432:${file("~/.ssh/id_rsa.pub")}"
  }
  scheduling = {
    preemptible = "true"
  }
}

output "instance_ip_addr" {
  value = "${google_compute_instance.gcp-instance.hostname}"
}

