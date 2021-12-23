resource "google_service_account" "airbyte-service-account" {
  account_id   = "airbyte-service-account"
  display_name = "Airbyte Service Account"
}

resource "google_service_account" "superset-service-account" {
  account_id   = "superset-service-account"
  display_name = "superset Service Account"
}

resource "google_service_account" "openmetadata-service-account" {
  account_id   = "openmetadata-service-account"
  display_name = "OpenMetadata Service Account"
}