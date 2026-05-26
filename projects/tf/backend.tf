
terraform {
  backend "s3" {
    bucket = "infra-mgmt-app-1"
    key    = "app/state/dev/tf.state"
    region = "us-east-1"
  }
}
