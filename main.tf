resource "proxmox_virtual_environment_vm" "debian" {
  name      = "vm-debian-test"
  node_name = var.virtual_environment_node_name

  clone {
    vm_id = 9001
  }

  agent {
	enabled = true
  }

  serial_device {
	device = "socket"
  }

  disk {
    datastore_id = var.datastore_id
    size         = 32
    interface    = "virtio0"
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
        address = "192.168.1.248/24"
	gateway = "192.168.1.1"
      }
    }
	datastore_id = var.datastore_id
  }
}
