resource "tls_private_key" "ssh" {
  for_each  = var.linux_virtual_machines
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each                        = var.linux_virtual_machines
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  disable_password_authentication = true
  network_interface_ids           = [data.azurerm_network_interface.linux_nic[each.key].id]
  allow_extension_operations      = false

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = tls_private_key.ssh[each.key].public_key_openssh
  }

  os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  for_each                   = var.windows_virtual_machines
  name                       = each.value.name
  resource_group_name        = each.value.resource_group_name
  location                   = each.value.location
  size                       = each.value.size
  admin_username             = each.value.admin_username
  admin_password             = each.value.admin_password
  network_interface_ids      = [data.azurerm_network_interface.windows_nic[each.key].id]
  allow_extension_operations = false
  encryption_at_host_enabled = true

  os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }
}
