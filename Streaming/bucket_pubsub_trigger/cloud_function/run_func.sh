gcloud functions deploy loadcitibikemodelstobq --gen2 --region='us-central1'\
 --runtime='python39'\
 --source='gs://ma-sabre-sandbox-01-lnd-bkt-01/code/citibike/cloud_func/gcs_to_bq_func.py'\
 --entry-point='main'\
 --trigger-topic='citibike-lnd-notif-tpc-d-01'