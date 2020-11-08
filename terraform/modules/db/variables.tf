variable focal_image {
  description = "Clean Focal image"
  default     = "ubuntu-2004-lts"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable machine_type {
  description = "Default machine type"
}

variable zone {
  description = "Default zone"
}

variable user_ssh {
  description = "Username for ssh private and public keys"
}

variable network {
  description = "Default network for actual environment"
}
