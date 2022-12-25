from google.cloud import bigquery


def load_file_to_bq(uri, table_id, config):
    client = bigquery.Client()
    load_job = client.load_table_from_uri(uri, table_id, job_config= config)
    print(load_job.result())
    destination_table = client.get_table(table_id)
    print("Loaded {} rows.".format(destination_table.num_rows))


def main(event, context):

    print(f"New file {event['attributes']['objectId']} published....")
    file_path = event['attributes']['objectId']

    if "bike" in file_path:
        config = bigquery.LoadJobConfig(
            schema=[
                bigquery.SchemaField("bike_id", "INTEGER"),
                bigquery.SchemaField("bike_type", "STRING"),
            ],
            skip_leading_rows=1,
            source_format=bigquery.SourceFormat.CSV,
        )
        table_id = "ma-sabre-sandbox-01.lz_citibike.src_trips"
        load_file_to_bq(file_path, table_id, config)
    elif "user" in file_path:
        config = bigquery.LoadJobConfig(
            schema=[
                bigquery.SchemaField("user_id", "INTEGER"),
                bigquery.SchemaField("user_type", "STRING"),
                bigquery.SchemaField("gender", "STRING"),
                bigquery.SchemaField("birth_year", "INTEGER"),
                bigquery.SchemaField("customer_plan", "STRING"),
            ],
            skip_leading_rows=1,
            source_format=bigquery.SourceFormat.CSV,
        )
        table_id = "ma-sabre-sandbox-01.lz_citibike.src_trips"
        load_file_to_bq(file_path, table_id, config)
    elif "station" in file_path:
        table_id = "ma-sabre-sandbox-01.lz_citibike.src_trips"
        #load_file_to_bq(file_path, table_id, config)
    elif "trip" in file_path:
        table_id = "ma-sabre-sandbox-01.lz_citibike.src_trips"
        #load_file_to_bq(file_path, table_id, config)
    else :
        print("cannot parse this file")

