resource "aws_resourcegroups_group" "symbiosis-rg" {
  name = "${var.resource_group_name}-${terraform.workspace}-rg"

  tags = {
    tf_release_version = var.tf_release_version
  }

  resource_query {
    query = <<JSON
{
  "Type": "TAG_FILTERS_1_0",
  "TagFilters": [
    {
      "Key": "app",
      "Values": ["symbiosis"]
    }
  ]
}
JSON
  }
}
