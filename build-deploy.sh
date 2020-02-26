gcloud builds submit --tag gcr.io/[project]/wp:v1
gcloud beta run deploy --image gcr.io/[project]/wp:v1 --add-cloudsql-instances storage1
gcloud beta run services delete wp
gcloud beta run deploy wp --image gcr.io/[project]/wp:v1 \
  --add-cloudsql-instances [instance] \
  --update-env-vars DB_HOST='127.0.0.1',DB_NAME=[wordpressDBname],DB_USER=[wordpressDBuser],DB_PASSWORD=[password],CLOUDSQL_INSTANCE='[project]:us-central1:[instance]'
