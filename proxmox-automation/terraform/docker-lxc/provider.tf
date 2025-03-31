terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}

provider "proxmox" {
    pm_api_url = "https://192.168.0.4:8006/api2/json"
    pm_tls_insecure = true
}