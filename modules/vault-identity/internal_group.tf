resource "vault_identity_group" "internal_group_readonly" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }

  name             = "${each.value.heritage}-${each.value.csp}-${each.value.asset_id}-readonly"
  type             = "internal"
  member_group_ids = [vault_identity_group.external_group_readonly[each.key].id]
  member_entity_ids = [vault_identity_entity.appid_vault_entity[each.key].id]
  policies         = ["kv-${each.value.asset_id}-readonly"]
  metadata = {
    asset_id = each.value.asset_id
  }
  namespace = "${each.value["heritage"]}/${each.value["csp"]}"
}

resource "vault_identity_group" "internal_group_admin" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }

  name             = "${each.value.heritage}-${each.value.csp}-${each.value.asset_id}-admin"
  type             = "internal"
  member_group_ids = [vault_identity_group.external_group_admin[each.key].id]
  policies         = ["kv-${each.value.asset_id}-admin"]
  metadata = {
    asset_id = each.value.asset_id
  }
  namespace = "${each.value["heritage"]}/${each.value["csp"]}"
}