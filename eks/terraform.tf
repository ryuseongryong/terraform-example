# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region  = var.region
  profile = var.profile
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "demo-rsr-terraform-backend"
    region = "ap-northeast-2"
    key    = "demo.tfstate"
    profile = "ryuseongryong"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.90.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.6"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.9"
    }

    http = {
      source = "hashicorp/http"
      version = "~> 3.3"
    }

    cloudinit = {
      source = "hashicorp/cloudinit"
      version = "~> 2.0"
    }

    null = {
      source = "hashicorp/null"
      version = "~> 3.2.3"
    }

    time = {
      source = "hashicorp/time"
      version = "~> 0.9.0"
      }

  }

  required_version = "~> 1.11.1"
}

data "aws_availability_zones" "available" {

}