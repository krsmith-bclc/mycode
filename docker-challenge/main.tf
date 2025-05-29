terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

# Provider block
provider "docker" {}

# resource block - ensures an image will become present
resource "docker_image" "simplegoservice" {
  name         = "registry.gitlab.com/alta3/simplegoservice"
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "nginxsimplegoservice" {
  image = docker_image.simplegoservice.image_id
  name  = "Alta3ResearchWebService"
  ports {
    internal = 9876
    external = 5432
  }
}