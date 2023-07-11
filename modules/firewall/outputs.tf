output "private_ip" {
  value = azurerm_firewall.firewall.private_ip_ranges
}