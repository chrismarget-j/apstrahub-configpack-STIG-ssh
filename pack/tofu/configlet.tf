#  Copyright (c) Juniper Networks, Inc., 2025-2025.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

locals {
  t = <<-EOT
    system {
      services {
        ssh {
          connection-limit $${connection_limit};
          max-sessions-per-connection $${max_sessions_per_connection};
          protocol-version v2;
          macs [hmac-sha2-256 hmac-sha2-512];
          ciphers [aes192-cbc aes256-cbc aes192-ctr aes256-ctr];
          key-exchange [ecdh-sha2-nistp521 ecdh-sha2-nistp384];
          client-alive-count-max 3;
          client-alive-interval 360;
        }
      }
    }
  EOT
}

resource "apstra_datacenter_configlet" "example" {
  blueprint_id = var.blueprint_id
  name = var.name
  condition = var.configlet_scope
  generators = [
    {
      config_style = "junos"
      section      = "top_level_hierarchical"
      template_text = templatestring(local.t, {
        connection_limit            = var.connection_limit
        max_sessions_per_connection = var.max_sessions_per_connection
      })
    },
  ]
}
