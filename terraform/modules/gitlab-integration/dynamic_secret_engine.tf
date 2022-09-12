resource "vault_aws_secret_backend" "invariance_aws" {
  path        = var.aws_secret_backend_path
  description = "AWS Secret Engine"
  provider    = vault.invariance_aws
}

resource "vault_aws_secret_backend" "shashparab_aws" {
  path        = var.aws_secret_backend_path
  description = "AWS Secret Engine"
  provider    = vault.shashparab_aws
}

resource "vault_gcp_secret_backend" "gcp" {
  path        = "gcp"
  description = "GCP Secret Engine"
  provider    = vault.invariance_gcp
}

resource "vault_gcp_secret_backend" "shashparab_gcp" {
  path        = "gcp"
  description = "GCP Secret Engine"
  provider    = vault.shashparab_gcp
}
