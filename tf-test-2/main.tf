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


resource "snowflake_database" "test" {
  name = "TEST"
}

resource "snowflake_schema" "fact" {
  name     = "FACT"
  database = snowflake_database.name
}

