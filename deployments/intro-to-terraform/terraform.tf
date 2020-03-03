terraform {
  backend "remote" {
    organization = "inside"

    workspaces {
      name = "workshop"
    }
  }
}
