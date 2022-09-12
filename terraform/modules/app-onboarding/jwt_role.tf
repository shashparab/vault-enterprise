resource "vault_jwt_auth_backend_role" "gitlab_runner_jwt_role" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }
  backend        = var.gitlab_jwt_path
  role_type      = "jwt"
  token_policies = ["kv-${each.value.asset_id}-readonly"]
  role_name      = "jwt-${each.value.heritage}-${each.value.csp}-${each.value.asset_id}-role"
  user_claim     = "user_email"
  claim_mappings = {
    environment           = "environment",
    environment_protected = "environment_protected",
    job_id                = "job_id",
    namespace_id          = "namespace_id",
    project_id            = "project_id",
    project_path          = "project_path",
    ref                   = "ref",
    ref_protected         = "ref_protected",
    ref_type              = "ref_type",
    user_id               = "user_id",
    user_email            = "user_email",
    pipeline_id           = "pipeline_id",
    user_login            = "user_login"
  }
  token_explicit_max_ttl = 300
  bound_claims = {
    "ref"      = "main"
    "ref_type" = "branch"
  }
}