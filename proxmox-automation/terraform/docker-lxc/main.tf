resource "proxmox_lxc" "lxc" {
  hostname = "docker-lxc"
  target_node = "proxmox"
  vmid    = 200
  tags = "container"
  ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
  password = var.password
  ssh_public_keys = var.ssh_public_keys
  unprivileged = true
  cores = 2
  memory = 2048
  swap = 2048
  start = true
  onboot = true
 
  features {
    nesting = true
  }

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "100G"
  }
  network {
    name   = "eth0"
    bridge = "vmbr0"
    firewall = false
    ip     = "192.168.0.10/24"
    gw     = "192.168.0.1"
    ip6    = "auto"
  } 
}