variable "asset_ids" {
  description = "A set of asset_ids to onbaord"
  default = [
    {
      "asset_id" : "appid-12",
      "csp" : "aws",
      "heritage" : "invariance",
      "assume_role_arn" : ["arn:aws:iam::797547647754:role/vault-test"],
      "azure_ad_admin_group_object_id" : "141ca31a-cf44-40ae-8cf8-b501523d1993",
      "azure_ad_readonly_group_object_id" : "a32d0ba6-e8f6-40b0-bb7b-5b03ccf4e0b6"
    },
    # {
    #   "asset_id" : "appid-12",
    #   "csp" : "gcp",
    #   "heritage" : "invariance",
    #   "azure_ad_admin_group_object_id" : "141ca31a-cf44-40ae-8cf8-b501523d1993",
    #   "azure_ad_readonly_group_object_id" : "a32d0ba6-e8f6-40b0-bb7b-5b03ccf4e0b6"
    # },
    {
      "asset_id" : "appid-34",
      "csp" : "aws",
      "heritage" : "invariance",
      "assume_role_arn" : ["arn:aws:iam::797547647754:role/vault-test"],
      "azure_ad_admin_group_object_id" : "a8824238-54ef-4a3e-81a7-6e4ecd96c309",
      "azure_ad_readonly_group_object_id" : "cc48c32c-90a0-465a-b811-7035b660cbe0"
    },
    # {
    #   "asset_id" : "appid-34",
    #   "csp" : "gcp",
    #   "heritage" : "invariance",
    #   "azure_ad_admin_group_object_id" : "a8824238-54ef-4a3e-81a7-6e4ecd96c309",
    #   "azure_ad_readonly_group_object_id" : "cc48c32c-90a0-465a-b811-7035b660cbe0"
    # },
    # {
    #   "asset_id" : "appid-56",
    #   "csp" : "aws",
    #   "heritage" : "shashparab",
    #   "assume_role_arn" : ["arn:aws:iam::797547647754:role/vault-test"],
    # },
  ]
}

variable "aws_secret_backend_path" {
  type    = string
  default = "aws"
}