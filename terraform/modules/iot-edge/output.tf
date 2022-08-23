output "public_ssh" {
  value = var.vm_type == "linux" ? "ssh -i ../.ssh/id_rsa ${local.vm_user_name}@${azurerm_public_ip.iot_edge.fqdn}" : "ssh ${local.vm_user_name}:${random_string.vm_password.result}@${azurerm_public_ip.iot_edge.fqdn}"
}
