variable "region" {
  type    = string
  default = "us-west1"
}
variable "project" {
    type= string
    description = "ID Google project"
    default = "qwiklabs-gcp-02-1b33822325a1"
}

variable  "data-project" {
    type = string
    description = "Name of data pipeline project to use as resource prefix"
    default = "test"
}

