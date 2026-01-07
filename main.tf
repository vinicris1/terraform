resource "proxmox_virtual_environment_vm" "debian" {
  name      = "vm-debian-test"
  node_name = var.virtual_environment_node_name

  clone {
    vm_id = 9000
  }

  disk {
    datastore_id = var.datastore_id
    size         = 32
    interface    = "scsi0"
  }
  memory{
	dedicated = 768
  }

  initialization {
	user_account {
		username = "vinicin"
		password = "Vinicin"
	}
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
	datastore_id = var.datastore_id
  }
}
