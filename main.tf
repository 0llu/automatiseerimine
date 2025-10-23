terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

resource "local_file" "greeting" {
  filename = "${path.module}/output/hello.txt"
  content  = "Tere, Terraform!\nSee fail on loodud IaC-ga.\n"
  
  file_permission = "0644"
}

resource "local_file" "config" {
  filename = "${path.module}/output/app.conf"
  content  = <<-EOT
    server {
      port = 8080
      host = "localhost"
    }
  EOT
  
  file_permission = "0644"
}