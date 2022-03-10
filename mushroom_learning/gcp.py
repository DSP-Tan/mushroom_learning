from mushroom_learning.params import BUCKET_NAME
import os
from tensorflow               import keras
from google.cloud             import storage
from dotenv                   import load_dotenv, find_dotenv
from os.path                  import join, dirname, abspath
import glob
# point to .env file
env_path = join(dirname(abspath(__file__)),'.env') # ../.env
# load your api key as environment variables
load_dotenv(env_path)


# CHANGE IF NEW MODEL
#LOCAL_PATH_TO_MODEL = "../model_1_species_vgg16"
#STORAGE_LOCATION_GCU = "models/model_1_species_vgg16"

LOCAL_PATH_TO_MODEL = "../model_species_simple_0.815"
STORAGE_LOCATION_GCU = "models/model_species_simple_0.815"

def save_model_to_gcp():
    """Uploads a folder (!) to the bucket."""
    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))
    
    rel_paths = glob.glob(LOCAL_PATH_TO_MODEL  + '/**', recursive=True)
    bucket = storage_client.get_bucket(BUCKET_NAME)
    for local_file in rel_paths:
        if os.path.isfile(local_file):
            blob = bucket.blob(STORAGE_LOCATION_GCU)
            blob.upload_from_filename(local_file)
    
    print("saved to", STORAGE_LOCATION_GCU)

    # make sure you saved your model locally before calling this function! (check save_model in Trainer class)

    # storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))
    # print("Storage Client",  storage_client)
    # bucket = storage_client.bucket(BUCKET_NAME)
    # blob = bucket.blob(STORAGE_LOCATION_GCU)
    # blob.upload_from_string(LOCAL_PATH_TO_MODEL)

    # print(
    #     "{} with contents {} uploaded to {}.".format(
    #         BUCKET_NAME, LOCAL_PATH_TO_MODEL, STORAGE_LOCATION_GCU
    #     )
    # )

def get_model():
    '''
    This retrieves a model from our local storage.
    '''
    return keras.models.load_model(LOCAL_PATH_TO_MODEL)

def load_model_from_gcp():
    """Downloads a blob from the bucket."""
    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))
    bucket = storage_client.get_bucket(BUCKET_NAME)
    blobs = bucket.list_blobs(prefix=STORAGE_LOCATION_GCU)  # Get list of files
    for blob in blobs:
        filename = blob.name.replace('/', '_')
        blob.download_to_filename(filename)  # Download

    model = get_model()
    return model

#if __name__ == '__main__':
    #model = load_model_from_gcp()
    #print(type(model))
