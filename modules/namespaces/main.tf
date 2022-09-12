#------------------------------------------------------------------------------
# To leverage more than one namespace, define a vault provider per namespace
#
#   root
#    ├── invariance
#    │   └── regulated
#    │       └── aws
#    │       └── gcp
#    │       └── azure
#    │       └── onprem
#    |   └── unregulated
#    │       └── aws
#    │       └── gcp
#    │       └── azure
#    │       └── onprem
#    └── shashparab
#    │   └── regulated
#    │       └── aws
#    │       └── gcp
#    │       └── azure
#    │       └── onprem
#    |   └── unregulated
#    │       └── aws
#    │       └── gcp
#    │       └── azure
#    │       └── onprem
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# To leverage more than one namespace, define a vault provider per namespace
#
#   root
#    ├── invariance
#    │   └── aws
#    |       └── unregulated
#    │       └── regulated
#    │   └── gcp
#    |       └── unregulated
#    │       └── regulated
#    │   └── azure
#    |       └── unregulated
#    │       └── regulated
#    │   └── onprem
#    |       └── unregulated
#    │       └── regulated
#    └── shashparab
#    │   └── aws
#    |       └── unregulated
#    │       └── regulated
#    │   └── gcp
#    |       └── unregulated
#    │       └── regulated
#    │   └── azure
#    |       └── unregulated
#    │       └── regulated
#    │   └── onprem
#    |       └── unregulated
#    │       └── regulated
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
resource "vault_namespace" "lshashparabseg" {
  provider = vault.root
  path     = "shashparab"
}


#--------------------------------------
# Create 'root/invariance/aws' namespace
#--------------------------------------
resource "vault_namespace" "invariance_aws" {
  provider = vault.invariance
  path     = "aws"
}



#--------------------------------------
# Create 'root/invariance/gcp' namespace
#--------------------------------------
resource "vault_namespace" "invariance_gcp" {
  provider = vault.invariance
  path     = "gcp"
}


#--------------------------------------
# Create 'root/invariance/azure' namespace
#--------------------------------------
resource "vault_namespace" "invariance_azure" {
  provider = vault.invariance
  path     = "azure"
}



#--------------------------------------
# Create 'root/invariance/onprem' namespace
#--------------------------------------
resource "vault_namespace" "invariance_onprem" {
  provider = vault.invariance
  path     = "onprem"
}



#--------------------------------------
# Create 'root/shashparab/aws' namespace
#--------------------------------------
resource "vault_namespace" "shashparab_aws" {
  provider = vault.shashparab
  path     = "aws"
}



#--------------------------------------
# Create 'root/shashparab/gcp' namespace
#--------------------------------------
resource "vault_namespace" "shashparab_gcp" {
  provider = vault.shashparab
  path     = "gcp"
}



#--------------------------------------
# Create 'root/shashparab/azure' namespace
#--------------------------------------
resource "vault_namespace" "shashparab_azure" {
  provider = vault.shashparab
  path     = "azure"
}



#--------------------------------------
# Create 'root/shashparab/onprem' namespace
#--------------------------------------
resource "vault_namespace" "shashparab_onprem" {
  provider = vault.shashparab
  path     = "onprem"
}
