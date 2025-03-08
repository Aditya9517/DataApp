terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "1.0.4"
    }
  }
}

# A simple data block that connects to Snowflake
data "snowflake_current_account" "this" {}

output "current_account" {
  value = data.snowflake_current_account.this.account
}


resource "snowflake_warehouse" "warehouse" {
  name                                = "TEST_WH"
  warehouse_type                      = "STANDARD"
  warehouse_size                      = "X-SMALL"
  max_cluster_count                   = 1
  min_cluster_count                   = 1
  scaling_policy                      = "ECONOMY"

}
