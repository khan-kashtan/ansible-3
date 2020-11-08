variable region {
  description = "Region"
  default     = "europe-west1"
}

variable source_ranges {
  default     = ["0.0.0.0/0"]
  description = "Allowed IP ranges for ssh connection"
}

variable network {
  description = "Default network for actual environment"
}

variable net_ip_ranges {
  description = "Internal network IP ranges"
}
