resource "google_service_account" "airbyte-service-account" {
  account_id   = "airbyte-service-account"
  display_name = "Airbyte Service Account"
}

resource "google_service_account" "superset-service-account" {
  account_id   = "superset-service-account"
  display_name = "superset Service Account"
}