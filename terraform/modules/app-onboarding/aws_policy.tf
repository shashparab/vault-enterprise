data "vault_policy_document" "aws_policy_document" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
    if asset_id_name.csp == "aws"
  }
  rule {
    path         = "${var.aws_secret_backend_path}/sts/${each.value.asset_id}"
    capabilities = ["read"]
  }
}

resource "vault_policy" "gitlab_jwt_aws_policy" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
    if asset_id_name.csp == "aws"
  }
  name      = "aws-${each.value.asset_id}"
  policy    = data.vault_policy_document.aws_policy_document[each.key].hcl
  namespace = "${each.value["heritage"]}/${each.value["csp"]}"
}
