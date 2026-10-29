terraform {
  required_version = ">=1.3.0"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">=1.63.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
}

# ---------------------------------------------------------------------------
# Hibernation placeholder
# ---------------------------------------------------------------------------
resource "null_resource" "hibernation" {
  count = var.hibernation_enabled ? 1 : 0

  triggers = {
    timing         = var.hibernation_timing
    tag            = var.hibernation_tag
    regions        = var.hibernation_regions
    resource_groups = var.hibernation_resource_groups
  }
}

# ---------------------------------------------------------------------------
# Security placeholder
# ---------------------------------------------------------------------------
resource "null_resource" "security" {
  count = var.security_disable_open_ports ? 1 : 0

  triggers = {
    enabled = tostring(var.security_disable_open_ports)
  }
}

# ---------------------------------------------------------------------------
# Cleanup placeholder
# ---------------------------------------------------------------------------
resource "null_resource" "cleanup" {
  count = (var.cleanup_fip_enabled || var.cleanup_volumes_enabled) ? 1 : 0

  triggers = {
    fip     = tostring(var.cleanup_fip_enabled)
    volumes = tostring(var.cleanup_volumes_enabled)
  }
}
