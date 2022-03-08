from mushroom_learning.params import BUCKET_NAME
import os
from tensorflow               import keras
from google.cloud             import storage
from dotenv                   import load_dotenv, find_dotenv
from os.path                  import join, dirname, abspath

# point to .env file
env_path = join(dirname(abspath(__file__)),'.env') # ../.env
env_path = find_dotenv() # automatic find

# load your api key as environment variables
load_dotenv(env_path)

def save_model_to_gcp(local_path_to_model, storage_location):
    """Uploads a file to the bucket."""

    # make sure you saved your model locally before calling this function! (check save_model in Trainer class)
    # Where is the model stored locally?

    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))
    bucket = storage_client.bucket(BUCKET_NAME)
    blob = bucket.blob(storage_location)
    blob.upload_from_string(local_path_to_model)

    print(
        "{} with contents {} uploaded to {}.".format(
            BUCKET_NAME, local_path_to_model, storage_location
        )
    )

def get_model(local_path_to_model):
    '''
    This retrieves a model from our local storage.
    '''
    print(local_path_to_model)
    return keras.models.load_model(local_path_to_model)

def load_model_from_gcp(storage_location):
    """Downloads a blob from the bucket."""
    
    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))

    bucket = storage_client.get_bucket(BUCKET_NAME)
    blobs = bucket.list_blobs(prefix=storage_location)  # Get list of files
    for blob in blobs:
        filename = blob.name.replace('/', '_')
        blob.download_to_filename(storage_location + filename)  # Download

    model = get_model()
    return model
