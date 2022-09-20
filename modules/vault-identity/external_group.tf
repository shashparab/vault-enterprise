resource "vault_identity_group" "external_group_readonly" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }

  name = "${each.value.heritage}-${each.value.csp}-${each.value.asset_id}-reader"
  type = "external"

  metadata = {
    asset_id = each.value.asset_id
  }
}
resource "vault_identity_group" "external_group_admin" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }

  name = "${each.value.heritage}-${each.value.csp}-${each.value.asset_id}-manager"
  type = "external"

  metadata = {
    asset_id = each.value.asset_id
  }
}