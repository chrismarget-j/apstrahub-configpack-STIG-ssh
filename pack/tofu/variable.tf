#  Copyright (c) Juniper Networks, Inc., 2025-2025.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

variable "blueprint_id" {
  type = string
}

variable "name" {
  type = string
  default = "SSH limits"
}

variable "connection_limit" {
  type = number
  default = 10
  description = "the maximum number of connections sessions for the ssh service per protocol (either IPv6 or IPv4)"
}

variable "max_sessions_per_connection" {
  type = number
  default = 5
  description = "Specify the maximum number of ssh sessions allowed per single SSH connection"
}

variable "configlet_scope" {
  type = string
  default = "role in [\"superspine\", \"spine\", \"leaf\", \"access\"]"
  description = "Selects systems where the configlet will be applied"
}