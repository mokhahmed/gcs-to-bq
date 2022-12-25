resource "google_storage_bucket" "code_bucket" {
  name = "ma-citibike-code-bkt-d-01"
  location  = "us"
}

resource "google_storage_bucket" "lnd_bucket" {
  name = "ma-citibike-lnd-bkt-d-01"
  location  = "us"
}

resource "google_storage_bucket_object" "users_lnd_folder" {
  name          = "users/"
  content       = "users lnd directory"
  bucket        = google_storage_bucket.lnd_bucket.name
}

resource "google_storage_bucket_object" "trips_lnd_folder" {
  name          = "trips/"
  content       = "trips lnd directory"
  bucket        = google_storage_bucket.lnd_bucket.name
}

resource "google_storage_bucket_object" "stations_lnd_folder" {
  name          = "stations/"
  content       = "stations lnd directory"
  bucket        = google_storage_bucket.lnd_bucket.name
}

resource "google_storage_bucket_object" "bikes_lnd_folder" {
  name          = "bikes/"
  content       = "bikes lnd directory"
  bucket        = google_storage_bucket.lnd_bucket.name
}

resource "google_pubsub_topic" "notifications_topic" {
  name = "citibike-lnd-notif-tpc-d-01"
}

resource "google_pubsub_topic_iam_binding" "binding" {
  topic       = google_pubsub_topic.notifications_topic.name
  role        = "roles/pubsub.publisher"

  members     = ["serviceAccount:service-191986646484@gs-project-accounts.iam.gserviceaccount.com"]
}

resource "google_storage_notification" "notification" {
  bucket            = google_storage_bucket.lnd_bucket.name
  payload_format    = "JSON_API_V1"
  topic             = google_pubsub_topic.notifications_topic.id
  event_types       = ["OBJECT_FINALIZE", "OBJECT_METADATA_UPDATE"]
  depends_on        = ["google_pubsub_topic_iam_binding.binding"]
}