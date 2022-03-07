import os
from tensorflow               import keras
from google.cloud             import storage
from mushroom_learning.params import BUCKET_NAME, STORAGE_LOCATION
from dotenv                   import load_dotenv, find_dotenv
from os.path                  import join, dirname, abspath


# point to .env file
env_path = join(dirname(abspath(__file__)),'.env') # ../.env
env_path = find_dotenv() # automatic find

# load your api key as environment variables
load_dotenv(env_path)

# PLEASE CHANGE WHEN CHANGING MODEL
LOCAL_STORAGE_PATH =  "../6_species_model_vgg19_v1"
STORAGE_LOCATION="models/6_species_model_vgg19_v1"

def save_model_to_gcp():
    """Uploads a file to the bucket."""

    # make sure you saved your model locally before calling this function! (check save_model in Trainer class)
    # Where is the model stored locally?

    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))
    bucket = storage_client.bucket(BUCKET_NAME)
    blob = bucket.blob(STORAGE_LOCATION)
    blob.upload_from_string(LOCAL_STORAGE_PATH)

    print(
        "{} with contents {} uploaded to {}.".format(
            BUCKET_NAME, LOCAL_STORAGE_PATH, STORAGE_LOCATION
        )
    )

def get_model():
    '''
    This retrieves a model from our local storage.
    '''
    print(LOCAL_STORAGE_PATH)
    return keras.models.load_model(LOCAL_STORAGE_PATH)

def load_model_from_gcp():
    """Downloads a blob from the bucket."""
    
    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))

    bucket = storage_client.get_bucket(BUCKET_NAME)
    blobs = bucket.list_blobs(prefix=STORAGE_LOCATION)  # Get list of files
    for blob in blobs:
        filename = blob.name.replace('/', '_')
        blob.download_to_filename(LOCAL_STORAGE_PATH + filename)  # Download

    model = get_model()
    return model

