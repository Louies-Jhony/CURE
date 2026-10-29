output "hibernation_status" {
  description = "Status of the hibernation schedule configuration."
  value       = var.hibernation_enabled ? "Hibernation enabled — schedule: ${var.hibernation_timing}" : "Hibernation disabled"
}

output "security_report" {
  description = "Summary of open ports configuration."
  value       = var.security_disable_open_ports ? "Open ports disabled" : "Open ports check skipped"
}

output "cleanup_report" {
  description = "Summary of cleanup configuration."
  value       = "FIP cleanup: ${var.cleanup_fip_enabled} | Volume cleanup: ${var.cleanup_volumes_enabled}"
}
