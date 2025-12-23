terraform {
  backend "gcs" {
    bucket = "gcsterraform-bucket"
    prefix = "compute"
  }
}
