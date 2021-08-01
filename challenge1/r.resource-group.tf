# resource "aws_resourcegroups_group" "symbiosis-rg" {
#   name = "${var.resource_group_name}-${terraform.workspace}-rg"

#   tags = {
#     tf_release_version = var.tf_release_version
#   }

# query = {
#   "TagFilters": [
#     {
#       "Key": "app",
#       "Values": ["symbiosis"]
#     }
#   ]
# }

# resource_query {
#     Type = "TAG_FILTERS_1_0"
#     query = json.dumps(query)
#   }

# }
