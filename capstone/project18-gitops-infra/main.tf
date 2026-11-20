terraform {
  required_version = ">= 1.5.0"
}

variable "environment" {
  default = "production"
}

resource "null_resource" "gitops_infra_deployment" {
  triggers = {
    deployed_by = "Amrish Yadav (amrish071)"
    env         = var.environment
    version     = "v1.0.0"
  }

  provisioner "local-exec" {
    command = "echo 'GitOps Infrastructure Apply Executed Successfully for ${var.environment}'"
  }
}

output "gitops_status" {
  value = "Project 18 GitOps Infra Deployed to ${var.environment} by amrish071"
}
