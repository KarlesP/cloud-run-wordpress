gcloud builds submit --tag gcr.io/WrdPrs/wp:v1
gcloud beta run deploy --image gcr.io/WrdPrs/wp:v1 --add-cloudsql-instances storage1
gcloud beta run services delete wp
gcloud beta run deploy wp --image gcr.io/WrdPrs/wp:v1 \
  --add-cloudsql-instances storage1 \
  --update-env-vars DB_HOST='127.0.0.1',DB_NAME=wordpress,DB_USER=wordpress,DB_PASSWORD=toor,CLOUDSQL_INSTANCE='WrdPrs:us-central1:storage1'
