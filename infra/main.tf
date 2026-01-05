terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Ressource 1 : Le réseau
resource "docker_network" "private_network" {
  name = "ansible_network"
}

# Ressource 2 : L'image (elle est définie APRES le réseau, pas dedans)
# infra/main.tf

resource "docker_image" "ubuntu_ssh" {
  name = "ubuntu:22.04"
}

resource "docker_container" "web1" {
  name  = "web1"
  image = docker_image.ubuntu_ssh.image_id

  # On installe SSH et Python manuellement au démarrage pour être certain que ça marche
  command = [
    "sh", "-c", 
    "apt-get update && apt-get install -y openssh-server python3 && mkdir /var/run/sshd && echo 'root:root' | chpasswd && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && /usr/sbin/sshd -D"
  ]

  ports {
    internal = 22
    external = 2222
  }

  ports {
    internal = 80
    external = 8080
  }

  networks_advanced {
    name = docker_network.private_network.name
  }
}