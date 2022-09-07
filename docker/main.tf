terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "jenkins" {
  name = var.image_name
  provisioner "local-exec" {
    command = "deploy-image.sh ${self.repository_url} ${var.image_name}"
  }
}

variable "image_name" {
  default     = "mycompany/jenkins"
  description = "Jenkins image name."
}

variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-west-2"
}