
JOB_NAME=$1
STAGING_BKT=$2
TEMP_BKT=$3
TRANSFORMER_PATH=$4
SCHEMA_PATH=$5
TRANSFORMER_NAME=$6
OUTPUT_TABLE=$7
INPUT_PATH=$8
TEMPLATE_LOCATION=gs://dataflow-templates-us-central1/latest/GCS_Text_to_BigQuery

gcloud dataflow jobs run $JOB_NAME
--gcs-location $TEMPLATE_LOCATION
--region us-central1
--staging-location
--parameters
  javascriptTextTransformGcsPath=$TRANSFORMER_PATH,
  JSONPath=$SCHEMA_PATH,
  javascriptTextTransformFunctionName=$TRANSFORMER_NAME,
  outputTable=$OUTPUT_TABLE,
  inputFilePattern=$INPUT_PATH,
  bigQueryLoadingTemporaryDirectory=$STAGING_BKT