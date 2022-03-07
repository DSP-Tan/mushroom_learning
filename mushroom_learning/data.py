import pathlib
import pandas as pd
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.preprocessing import image_dataset_from_directory
from google.cloud import storage
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
from mushroom_learning.params import BUCKET_NAME, BUCKET_TRAIN_DATA_PATH
from os.path import join, dirname, abspath
from dotenv import load_dotenv, find_dotenv


# point to .env file
env_path = join(dirname(abspath(__file__)),'.env') # ../.env
env_path = find_dotenv() # automatic find 

# load your api key as environment variables
load_dotenv(env_path)

def get_images_directory(directory):
    data_dir = pathlib.Path(directory)
    return data_dir

def count_images(data_dir): 
    return len(list(data_dir.glob('*/*.jpg')))

def get_data_from_gcp(nrows=10000, optimize=False, **kwargs):
    """method to get the training data (or a portion of it) from google cloud bucket"""
    
    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))

    bucket = storage_client.bucket(BUCKET_NAME)
    blob = bucket.blob("fungi_train_val.tgz")
    contents = blob.download_as_string()
    return contents



    # dataset_url = "https://storage.cloud.google.com/mushroom-bucket-le-wagon/fungi_train_val.tgz"
    # data_dir = tf.keras.utils.get_file('images', origin=dataset_url, untar=True)
    # data_dir = pathlib.Path(data_dir)
    # print(data_dir)
    # return data_dir





def load_training_data(data_dir):
    img_height = 224
    img_width = 224
    batch_size = 32

    return tf.keras.utils.image_dataset_from_directory(
      data_dir,
      labels='inferred',
      label_mode='binary', 
      validation_split=0.2,
      subset="training",
      seed=123,
      image_size=(img_height, img_width),
      batch_size=batch_size
    )

def load_validation_data(data_dir):
    img_height = 224
    img_width = 224
    batch_size = 32
    
    return tf.keras.utils.image_dataset_from_directory(
      data_dir,
      labels='inferred', 
      label_mode='binary', 
      validation_split=0.2,
      subset="validation",
      seed=123,
      image_size=(img_height, img_width),
      batch_size=batch_size
    )

if __name__ == '__main__':
    #data_dir = get_images_directory()
    #count_images = count_images()
    data_dir = get_data_from_gcp(nrows=10000)
    
    train_ds = load_training_data(data_dir)
    print(len(train_ds))
    val_ds = load_validation_data(data_dir)
    
    

