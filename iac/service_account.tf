resource "google_service_account" "airbyte-service-account" {
  account_id   = "airbyte-service-account"
  display_name = "Airbyte Service Account"
}