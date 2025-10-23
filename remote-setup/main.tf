terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

variable "target_host" {
  description = "IP of the remote Ubuntu server"
  type        = string
  default     = "10.0.81.105"
}

variable "ssh_user" {
  description = "SSH user on the Ubuntu server"
  type        = string
  default     = "kasutaja"
}

variable "ssh_private_key" {
  description = "Absolute path to the private key file on Windows"
  type        = string
  default     = "C:/Users/Kasutaja/.ssh/id_ed25519"
}

resource "null_resource" "ubuntu_setup" {
  triggers = {
    index_hash = filemd5("${path.module}/files/index.html")
    nginx_hash = filemd5("${path.module}/files/nginx.conf")
  }

  connection {
    type        = "ssh"
    host        = var.target_host
    user        = var.ssh_user
    private_key = file(var.ssh_private_key)
    timeout     = "2m"
  }

  # 1) Kopeeri failid
  provisioner "file" {
    source      = "${path.module}/files/index.html"
    destination = "/tmp/index.html"
  }

  provisioner "file" {
    source      = "${path.module}/files/nginx.conf"
    destination = "/tmp/nginx-custom.conf"
  }

  # 2) Käivita käsud remote serveris (sudo ei küsi parooli)
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -qq",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo mv /tmp/nginx-custom.conf /etc/nginx/sites-available/custom",
      "sudo ln -sf /etc/nginx/sites-available/custom /etc/nginx/sites-enabled/",
      "sudo nginx -t",
      "sudo systemctl reload nginx"
    ]
  }
}

output "deployed_host" {
  description = "IP of deployed Ubuntu server"
  value       = var.target_host
}



