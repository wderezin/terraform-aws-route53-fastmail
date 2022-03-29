
data aws_route53_zone zone {
  zone_id = local.zone_id
}

resource aws_route53_record mx-0 {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = data.aws_route53_zone.zone.name
  type    = "MX"
  ttl     = local.ttl

  records = [
    "10 in1-smtp.messagingengine.com.",
    "20 in2-smtp.messagingengine.com"
  ]
}

resource aws_route53_record mx-1 {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "*.${data.aws_route53_zone.zone.name}"
  type    = "MX"
  ttl     = local.ttl

  records = [
    "10 in1-smtp.messagingengine.com.",
    "20 in2-smtp.messagingengine.com"
  ]
}

resource aws_route53_record spf {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = data.aws_route53_zone.zone.name
  type    = "SPF"
  ttl     = local.ttl

  records = [
    "v=spf1 include:spf.messagingengine.com ${local.extra_spf} ?all"
  ]
}

resource aws_route53_record txt {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = data.aws_route53_zone.zone.name
  type    = "TXT"
  ttl     = local.ttl

  records = [
    "v=spf1 include:spf.messagingengine.com ${local.extra_spf} ?all"
  ]
}

resource aws_route53_record domainkey {
  count   = 3
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "fm${count.index}._domainkey.${data.aws_route53_zone.zone.name}"
  type    = "CNAME"
  ttl     = local.ttl

  records = [
    "fm${count.index}.${data.aws_route53_zone.zone.name}.fmhosted.com."
  ]
}

resource aws_route53_record caldav {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "_caldavs_.tcp.${data.aws_route53_zone.zone.name}"
  type    = "SRV"
  ttl     = local.ttl

  records = [
    "0 1 443 caldav.fastmail.com."
  ]
}

resource aws_route53_record carddav {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "_carddav._tcp.${data.aws_route53_zone.zone.name}"
  type    = "SRV"
  ttl     = local.ttl

  records = [
    "0 1 443 carddav.fastmail.com."
  ]
}

resource aws_route53_record imaps {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "_imaps._tcp.${data.aws_route53_zone.zone.name}"
  type    = "SRV"
  ttl     = local.ttl

  records = [
    "0 1 993 imap.fastmail.com."
  ]
}

resource aws_route53_record submission {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "_submission._tcp.${data.aws_route53_zone.zone.name}"
  type    = "SRV"
  ttl     = local.ttl

  records = [
    "0 1 587 smtp.fastmail.com."
  ]
}

resource aws_route53_record mail {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "${local.web_hostname}.${data.aws_route53_zone.zone.name}"
  type    = "A"
  ttl     = local.ttl

  records = [
    "66.111.4.147",
    "66.111.4.148"
  ]
}