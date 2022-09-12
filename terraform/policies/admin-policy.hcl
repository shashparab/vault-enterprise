# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage tokens
path "auth/token/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List ACL policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage secrets engines broadly across Vault.
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List enabled secrets engines
path "sys/mounts"
{
  capabilities = ["read", "list"]
}

# Manage transit secrets engine
path "transit/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Read health checks
path "sys/health"
{
  capabilities = ["read", "sudo"]
}

# Manage namespaces
path "sys/namespaces/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create and manage entities and groups
path "identity/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}

path "*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage namespaces
# path "ns1/sys/namespaces/*" {
#    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
# }

# Manage namespaces
# path "ns1/ns2/sys/namespaces/*" {
#    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
# }