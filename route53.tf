# get hosted zone details
# terraform aws data hosted zone
data "aws_route53_zone" "hosted_zone" {
  name = "techgirlrennie.com"
}

# create a record set in route 53
# terraform aws route 53 record
resource "aws_route53_record" "site_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "techgirlrennie.com"
  type    = "A"

  alias {
    name                   = aws_lb.ECS-ALB.dns_name
    zone_id                = aws_lb.ECS-ALB.zone_id
    evaluate_target_health = true
  }
}