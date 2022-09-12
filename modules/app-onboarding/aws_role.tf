resource "vault_aws_secret_backend_role" "aws_role" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
    if asset_id_name.csp == "aws"
  }
  backend         = "aws"
  credential_type = "assumed_role"
  role_arns       = each.value.assume_role_arn
  name            = each.value.asset_id
  namespace       = "${each.value.heritage}/${each.value.csp}"
}
