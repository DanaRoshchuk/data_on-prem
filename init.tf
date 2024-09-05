/*terraform {
  required_providers {
    scalr = {
      source = "Scalr/scalr" # the latest provider version will be used
    }
  }
}*/

terraform {
    required_providers {
        scalr = {
            source = "registry.main.scalr.dev/scalr/scalr"
            version= "1.0.0-rc-SCALRCORE-31421"
        }
    }
}

