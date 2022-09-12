variable "asset_ids" {
  description = "A set of asset_ids to onbaord"
  default = [
    {
      "asset_id" : "appid-12",
      "csp" : "aws",
      "heritage" : "invariance",
      "assume_role_arn" : ["arn:aws:iam::797547647754:role/vault-test"],
    },
    {
      "asset_id" : "appid-12",
      "csp" : "gcp",
      "heritage" : "invariance",
    },
    {
      "asset_id" : "appid-34",
      "csp" : "aws",
      "heritage" : "invariance",
      "assume_role_arn" : ["arn:aws:iam::797547647754:role/vault-test"],
    },
    {
      "asset_id" : "appid-34",
      "csp" : "gcp",
      "heritage" : "invariance",
    },
    {
      "asset_id" : "appid-56",
      "csp" : "aws",
      "heritage" : "shashparab",
      "assume_role_arn" : ["arn:aws:iam::797547647754:role/vault-test"],
    },
  ]
}

variable "aws_secret_backend_path" {
  type    = string
  default = "aws"
}