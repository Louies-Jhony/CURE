##############################################################################
# CURE - Cloud Unified Resource Engine
# Terraform variable declarations — must match ibm_catalog.json configuration keys
##############################################################################

variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key used to authenticate and provision resources."
  type        = string
  sensitive   = true
}

# ---------------------------------------------------------------------------
# Hibernation
# ---------------------------------------------------------------------------

variable "hibernation_enabled" {
  description = "Enable or disable scheduled hibernation of resources to reduce costs when idle."
  type        = bool
  default     = false
}

variable "hibernation_timing" {
  description = "Cron expression defining when hibernation starts. Example: '0 20 * * 1-5' = weekdays at 8 PM. Only used when hibernation_enabled is true."
  type        = string
  default     = "0 20 * * 1-5"
}

variable "hibernation_tag" {
  description = "Tag applied to resources targeted for hibernation. Example: 'hibernate:true'. Only used when hibernation_enabled is true."
  type        = string
  default     = "hibernate:true"
}

variable "hibernation_regions" {
  description = "IBM Cloud region to apply hibernation. Only used when hibernation_enabled is true."
  type        = string
  default     = "us-south"
}

variable "hibernation_resource_groups" {
  description = "Comma-separated list of IBM Cloud resource group names to scope hibernation. Only used when hibernation_enabled is true."
  type        = string
  default     = "Default"
}

# ---------------------------------------------------------------------------
# Security
# ---------------------------------------------------------------------------

variable "security_disable_open_ports" {
  description = "Enable to automatically detect and disable open/unrestricted inbound ports on security groups."
  type        = bool
  default     = false
}

# ---------------------------------------------------------------------------
# Cleanup
# ---------------------------------------------------------------------------

variable "cleanup_fip_enabled" {
  description = "Enable to automatically release unattached Floating IPs to avoid unnecessary charges."
  type        = bool
  default     = false
}

variable "cleanup_volumes_enabled" {
  description = "Enable to automatically delete unattached block storage volumes that are no longer in use."
  type        = bool
  default     = false
}
