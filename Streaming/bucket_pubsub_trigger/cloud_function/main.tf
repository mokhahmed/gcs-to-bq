

resource "google_cloudfunctions2_function" "function" {
  name        = "citibike-data-load-func"
  location    = "us-central1"
  description = "load citibike data into bq"

  build_config {
    runtime     = "python39"
    entry_point = "main"

    source {
      storage_source {
        bucket = google_storage_bucket.code_bucket.name
        object = "gsc_to_bq_func/gsc_to_bq_func.zip"
      }
    }

    event_trigger {
      trigger_region = "us-central1"
      event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
      pubsub_topic   = google_pubsub_topic.notifications_topic.id
      retry_policy   = "RETRY_POLICY_RETRY"
    }

  }
}
