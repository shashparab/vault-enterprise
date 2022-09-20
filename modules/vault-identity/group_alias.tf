resource "vault_identity_group_alias" "group-alias-readonly" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }
  name           = each.value.azure_ad_readonly_group_object_id
  mount_accessor = "auth_oidc_18e188b8"
  canonical_id   = vault_identity_group.external_group_readonly[each.key].id
}

resource "vault_identity_group_alias" "group-alias-admin" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }
  name           = each.value.azure_ad_admin_group_object_id
  mount_accessor = "auth_oidc_18e188b8"
  canonical_id   = vault_identity_group.external_group_admin[each.key].id
}