# Terraform AWS Route53 Fastmail module

Add the needed DNS records to an AWS Route53 zone.  The following items are added.

- MX records for in1-smtp.messagingengine.com and in2-smtp.messagingengine.com.
- SPF records
- The _domainkey record for fastmail to validate the domain
- CALDAV auto discovery record
- CARDDAV auto discovery record
- IMAPS auto discovery record
- SUBMISSION auto discovery record
- Configure web access with default mail.<domain>
- Optional configuration for mailchimp to send mail as your domain
