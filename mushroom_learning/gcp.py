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

<<<<<<< HEAD
# PLEASE CHANGE WHEN CHANGING MODEL
LOCAL_STORAGE_PATH =  "/home/stella/code/DSP-Tan/mushroom_learning/our_first_model"
# LOCAL_STORAGE_PATH =  "../our_first_model"
=======
# CHANGE IF NEW MODEL 
LOCAL_PATH_TO_MODEL = "../model_species_vgg_v1"
STORAGE_LOCATION_GCU = "models/model_6_species_vgg19_v1"
>>>>>>> 9f3483a068089ca3f03e4c53706d52dd70fcdc0a

def save_model_to_gcp():
    """Uploads a file to the bucket."""

    # make sure you saved your model locally before calling this function! (check save_model in Trainer class)
    # Where is the model stored locally?

    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))
    bucket = storage_client.bucket(BUCKET_NAME)
    blob = bucket.blob(STORAGE_LOCATION_GCU)
    blob.upload_from_string(LOCAL_PATH_TO_MODEL)

    print(
        "{} with contents {} uploaded to {}.".format(
            BUCKET_NAME, LOCAL_PATH_TO_MODEL, STORAGE_LOCATION_GCU
        )
    )

def get_model():
    '''
    This retrieves a model from our local storage.
    '''
    return keras.models.load_model(LOCAL_PATH_TO_MODEL)

def load_model_from_gcp():
    """Downloads a blob from the bucket."""
    
    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))
<<<<<<< HEAD
    def get_model():
        print(LOCAL_STORAGE_PATH)
        return keras.models.load_model(LOCAL_STORAGE_PATH)

    print(os.environ['gcp_json_path'])
=======

>>>>>>> 9f3483a068089ca3f03e4c53706d52dd70fcdc0a
    bucket = storage_client.get_bucket(BUCKET_NAME)
    blobs = bucket.list_blobs(prefix=STORAGE_LOCATION_GCU)  # Get list of files
    for blob in blobs:
        filename = blob.name.replace('/', '_')
        blob.download_to_filename(STORAGE_LOCATION_GCU + filename)  # Download

    model = get_model()
    return model