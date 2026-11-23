terraform {
  required_version = ">= 1.5.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "infra_manifest" {
  filename = "${path.module}/infra-state.txt"
  content  = "Project 12: Automated Terraform Plan Validation on Push - Amrish Yadav"
}

output "manifest_path" {
  value = local_file.infra_manifest.filename
}
