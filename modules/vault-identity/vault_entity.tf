resource "vault_identity_entity" "appid_vault_entity" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }
  name = each.value.asset_id
  metadata = {
    asset_id = each.value.asset_id
    csp      = each.value.csp
    heritage = each.value.heritage
  }
}


resource "vault_identity_entity_alias" "appid_vault_entity" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }
  name           = "app/${each.value.asset_id}"
  mount_accessor = "auth_jwt_8932a2fa"
  canonical_id   = vault_identity_entity.appid_vault_entity[each.key].id
}
