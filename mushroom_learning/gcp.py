import sys
from os.path import dirname, abspath, join
sys.path.append(join(dirname(abspath(__file__)), ".."))

from mushroom_learning.params import BUCKET_NAME
import os
from tensorflow               import keras
from google.cloud             import storage
from dotenv                   import load_dotenv, find_dotenv
from os.path                  import join, dirname, abspath
import glob
import tensorflow as tf

env_path = join(dirname(abspath(__file__)),'.env') # ../.env
load_dotenv(env_path)

# CHANGE MODEL NAME 
MODEL_NAME = 'model_2_species_vgg16'
LOCAL_PATH_TO_MODEL = f"../{MODEL_NAME}"
LOCAL_PATH_TO_DOWNLOADED_MODEL = f"../models_from_gcp/{MODEL_NAME}"
STORAGE_LOCATION_GCU = f"models/{MODEL_NAME}"

def save_model_to_gcp():
    """Uploads a folder (!) to the bucket."""
    # model = get_model()
    # tf.saved_model.save(model, "test_folder")
    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))
    
    rel_paths = glob.glob(LOCAL_PATH_TO_MODEL  + '/**', recursive=True)
    bucket = storage_client.get_bucket(BUCKET_NAME)
    for local_file in rel_paths:
        if os.path.isfile(local_file):
            blob = bucket.blob(f'{STORAGE_LOCATION_GCU}{local_file.replace(LOCAL_PATH_TO_MODEL, "")}')
            blob.upload_from_filename(local_file)
    
    print("Saved to", STORAGE_LOCATION_GCU)

def get_model():
    '''
    This retrieves a model from our local storage.
    '''
    return keras.models.load_model(LOCAL_PATH_TO_DOWNLOADED_MODEL)

def load_model_from_gcp():
    """Downloads a blob from the bucket."""
    
    if not os.path.exists('../models_from_gcp'):
        os.mkdir('../models_from_gcp')
    if not os.path.exists(f'../models_from_gcp/{MODEL_NAME}'):
        os.mkdir(f'../models_from_gcp/{MODEL_NAME}')
    if not os.path.exists(f'../models_from_gcp/{MODEL_NAME}/variables'):
        os.mkdir(f'../models_from_gcp/{MODEL_NAME}/variables')
    
    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))
    bucket = storage_client.get_bucket(BUCKET_NAME)
    blobs = bucket.list_blobs(prefix=STORAGE_LOCATION_GCU)  #
    for blob in blobs:
        print(blob)
        filename = blob.name.replace('/', '_').replace(f'models_{MODEL_NAME}_', '')
        print(filename)
        if filename.startswith('variables'):
            blob.download_to_filename(join(f'{LOCAL_PATH_TO_DOWNLOADED_MODEL}/variables', filename.replace('variables_', '')))  # Downloa
        else:
            blob.download_to_filename(join(LOCAL_PATH_TO_DOWNLOADED_MODEL, filename)) 
            
    return get_model()

if __name__ == '__main__':
    #save_model_to_gcp()
    # model = load_model_from_gcp()
    # print(type(model))
