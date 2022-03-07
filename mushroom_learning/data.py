import    pathlib
import    os
import    tensorflow as tf
from      tensorflow import keras
from      tensorflow.keras.preprocessing import image_dataset_from_directory

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

def count_images():
    return len(list(data_dir.glob('*/*.jpg')))

def get_data_from_gcp(nrows=10000, optimize=False, **kwargs):
    """method to get the training data (or a portion of it) from google cloud bucket"""
    
    storage_client = storage.Client.from_service_account_json(os.getenv("gcp_json_path"))

    bucket = storage_client.bucket(BUCKET_NAME)
    blob = bucket.blob("fungi_train_val.tgz")
    contents = blob.download_as_string()
    return contents

def load_training_data(data_dir):
    img_height = 224
    img_width = 224
    batch_size = 32

    data_dir = get_images_directory()

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

    data_dir = get_images_directory()

    return tf.keras.utils.image_dataset_from_directory(
      data_dir,
      labels='inferred',
      label_mode='binary',
      seed=123,
      image_size=(img_height, img_width),
      batch_size=batch_size
    )

if __name__ == '__main__':
    data_dir = get_images_directory()
    count_images = count_images()
