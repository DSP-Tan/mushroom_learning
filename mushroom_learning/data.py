from mushroom_learning.params import BUCKET_NAME, BUCKET_TRAIN_DATA_PATH

from os.path import join, dirname, abspath
from dotenv import load_dotenv, find_dotenv
import pathlib
from google.cloud import storage
import os
import tensorflow as tf
from tensorflow import keras

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
from mushroom_learning.params import BUCKET_NAME, BUCKET_TRAIN_DATA_PATH

env_path = join(dirname(abspath(__file__)),'.env')
load_dotenv(env_path)

IMG_HEIGHT = 224
IMG_WIDTH = 224
BATCH_SIZE = 32

def get_images_directory(path):
    data_dir = pathlib.Path(path)
    return data_dir

def count_images(data_dir):
    return len(list(data_dir.glob('*/*.jpg')))

def load_training_data(data_dir):

    return tf.keras.utils.image_dataset_from_directory(
      data_dir,
      labels='inferred',
      validation_split=0.2,
      subset="training",
      seed=123,
      image_size=(IMG_HEIGHT, IMG_WIDTH),
      batch_size=BATCH_SIZE
    )
    
def load_validation_data(data_dir):

    return tf.keras.utils.image_dataset_from_directory(
      data_dir,
      labels='inferred',
      validation_split=0.2,
      subset="validation",
      seed=123,
      image_size=(IMG_HEIGHT, IMG_WIDTH),
      batch_size=BATCH_SIZE
    )

def load_testing_data(data_dir):
    return tf.keras.utils.image_dataset_from_directory(
      data_dir,
      labels='inferred',
      seed=123,
      image_size=(IMG_HEIGHT, IMG_WIDTH),
      batch_size=BATCH_SIZE
    )

def get_labels_from_tfdataset(tfdataset, batched=False):

    labels = list(map(lambda x: x[1], tfdataset)) 

    if not batched:
        return tf.concat(labels, axis=0) 

    return labels

def get_inputs_from_tfdataset(tfdataset, batched=False):

    labels = list(map(lambda x: x[0], tfdataset)) 

    if not batched:
        return tf.concat(labels, axis=0) 

    return labels

if __name__ == '__main__':
    data_dir = get_images_directory("../raw_data/mushrooms_species_train_test/train")
    data_dir_test = get_images_directory("../raw_data/mushrooms_species_train_test/test")

    count_images_train = count_images(data_dir)
    count_images_test = count_images(data_dir_test)

    train_ds = load_training_data(data_dir)
    val_ds = load_validation_data(data_dir)
    test_ds = load_testing_data(data_dir_test)
    

