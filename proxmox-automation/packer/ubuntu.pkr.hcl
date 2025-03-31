packer {
  required_plugins {
    name = {
      version = "~> 1"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox" "ubuntu" {
  username    = "terraform-prov@pve"
  password    = "{{ env `PROXMOX_PASSWORD` }}"
  url         = "https://192.168.0.51:8006/api2/json"
  node        = "proxmox"
  iso_file    = "local:iso/ubuntu-22.04-server-cloudimg-amd64.img"
  vm_name     = "ubuntu-template"
  memory      = 2048
  cores       = 2
  os          = "l26"  # Linux 2.6/3.x/4.x
  ssh_username = "ubuntu"
  ssh_password = "temp_password"
  ssh_timeout  = "20m"

  cloud_init {
    user_data_file = "http/user-data"
  }

  qemu_agent = true
}

build {
  name = "ubuntu-2204-template"
  sources = ["source.proxmox.ubuntu"]

  provisioner "shell" {
    inline = ["echo 'Preparando a VM...'"]
  }

  provisioner "shell" {
    script = "scripts/setup.sh"
  }

  provisioner "shell" {
    script = "scripts/cleanup.sh"
  }

  post-processor "proxmox-template" {
    template_name = "ubuntu-2204-template"
  }
}