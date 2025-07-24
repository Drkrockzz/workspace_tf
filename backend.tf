terraform {
  backend "s3" {
    bucket = "tf-state-drk"
    key    = "key/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}
