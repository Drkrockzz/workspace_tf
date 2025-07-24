terraform {
  backend "s3" {
    bucket = "tf-statedrk"
    key    = "key/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}
