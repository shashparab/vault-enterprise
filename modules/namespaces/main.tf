#------------------------------------------------------------------------------
# To leverage more than one namespace, define a vault provider per namespace
#
#   root
#    ├── invariance
#    │   └── aws
#    │   └── gcp
#    │   └── azure
#    │   └── onprem
#    └── shashparab
#    │   └── aws
#    │   └── gcp
#    │   └── azure
#    │   └── onprem
#------------------------------------------------------------------------------

#--------------------------------------
# Create 'root/invariance' namespace
#--------------------------------------
resource "vault_namespace" "invariance" {
  provider = vault.root
  path     = "invariance"
}

#--------------------------------------
# Create 'root/shashparab' namespace
#--------------------------------------
resource "vault_namespace" "shashparab" {
  provider = vault.root
  path     = "shashparab"
}

#--------------------------------------
# Create 'root/invariance/aws' namespace
#--------------------------------------
resource "vault_namespace" "invariance_aws" {
  provider   = vault.invariance
  path       = "aws"
  depends_on = [vault_namespace.invariance]
}

#--------------------------------------
# Create 'root/invariance/gcp' namespace
#--------------------------------------
resource "vault_namespace" "invariance_gcp" {
  provider   = vault.invariance
  path       = "gcp"
  depends_on = [vault_namespace.invariance]
}

#--------------------------------------
# Create 'root/invariance/azure' namespace
#--------------------------------------
resource "vault_namespace" "invariance_azure" {
  provider   = vault.invariance
  path       = "azure"
  depends_on = [vault_namespace.invariance]
}

#--------------------------------------
# Create 'root/invariance/onprem' namespace
#--------------------------------------
resource "vault_namespace" "invariance_onprem" {
  provider   = vault.invariance
  path       = "onprem"
  depends_on = [vault_namespace.invariance]
}

#--------------------------------------
# Create 'root/shashparab/aws' namespace
#--------------------------------------
resource "vault_namespace" "shashparab_aws" {
  provider   = vault.shashparab
  path       = "aws"
  depends_on = [vault_namespace.shashparab]
}

#--------------------------------------
# Create 'root/shashparab/gcp' namespace
#--------------------------------------
resource "vault_namespace" "shashparab_gcp" {
  provider   = vault.shashparab
  path       = "gcp"
  depends_on = [vault_namespace.shashparab]
}

#--------------------------------------
# Create 'root/shashparab/azure' namespace
#--------------------------------------
resource "vault_namespace" "shashparab_azure" {
  provider   = vault.shashparab
  path       = "azure"
  depends_on = [vault_namespace.shashparab]
}

#--------------------------------------
# Create 'root/shashparab/onprem' namespace
#--------------------------------------
resource "vault_namespace" "shashparab_onprem" {
  provider   = vault.shashparab
  path       = "onprem"
  depends_on = [vault_namespace.shashparab]
}
