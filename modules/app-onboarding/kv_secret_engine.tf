resource "vault_mount" "kvv2" {
  type        = "kv-v2"
  description = "KV Version 2 secret engine mount"
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }
  path      = each.value.asset_id
  namespace = "${each.value["heritage"]}/${each.value["csp"]}"
}