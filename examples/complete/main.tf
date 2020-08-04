
data aws_route53_zone default {
  name = "acme.com"
}

module "route53-fastmail" {
  source  = "daringway/route53-fastmail/aws"
  zone_id = data.aws_route53_zone.default.zone_id

  //  These are all optional.  Default values shown.
  enable_mailchimp = false
  extra_spf        = ""
  ttl              = 3600
  web_hostname     = "mail"
}