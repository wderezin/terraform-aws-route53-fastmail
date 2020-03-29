variable extra_spf {
  type        = string
  default     = ""
  description = "If you need to add extra configuration information to the SPF record."
}

variable ttl {
  type        = number
  default     = 3600
  description = "The DNS TTL for all records."
}

variable enable_mailchimp {
  type        = bool
  default     = false
  description = "Add the required for SPF and TXT records for mail to be sent from mailchimp."
}

variable web_hostname {
  type        = string
  default     = "mail"
  description = "The hostname to use for web access."
}
