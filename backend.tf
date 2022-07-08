terraform {
  cloud {
    organization = "jaware-hc-demos"

    workspaces {
      name = "tf-packer-aws"
    }
  }
}