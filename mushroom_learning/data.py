import pathlib
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.preprocessing import image_dataset_from_directory
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

def get_images_directory():
    directory = "../raw_data/mushroom_poison"
    data_dir = pathlib.Path(directory)
    return data_dir

def count_images(): 
    return len(list(data_dir.glob('*/*.jpg')))

def load_training_data():
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

def load_validation_data():
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
    

