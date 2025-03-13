
locals {
  alb_name = "${var.cluster_name}-alb"
}

module "alb" {
    source = "terraform-aws-modules/alb/aws"
    version = "9.13.0"

    name = "${local.alb_name}"

    load_balancer_type = "application"

    vpc_id = module.vpc.vpc_id
    subnets = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
    security_group_ingress_rules = {
        all_http = {
        from_port   = 80
        to_port     = 80
        ip_protocol = "tcp"
        description = "HTTP web traffic"
        cidr_ipv4   = "0.0.0.0/0"
        }
        all_https = {
        from_port   = 443
        to_port     = 443
        ip_protocol = "tcp"
        description = "HTTPS web traffic"
        cidr_ipv4   = "0.0.0.0/0"
        }
    }
    security_group_egress_rules = {
        all = {
        ip_protocol = "-1"
        cidr_ipv4   = "10.21.0.0/16"
        }
    }

    listeners = [
        {
            port               = 80
            protocol           = "HTTP"
            target_group_index = 0
            forward = {
                target_group_key = "one"
            }
        }
    ]

    target_groups = {
        one = {
            target_type = "instance"
            target_id = "i-0a13fcdc084c739e7"
            # target_type = "ip"
            # target_id = module.vpc.private_subnets[0]
            target_port = 80
            protocol = "HTTP"
        },
        two = {
            target_type = "instance"
            target_id = "i-01be603ff57cb94de"
            # target_type = "ip"
            # target_id = module.vpc.private_subnets[1]
            target_port = 80
            protocol = "HTTP"
        }
    }
}