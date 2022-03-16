import sys
from os.path import dirname, abspath, join
sys.path.append(join(dirname(abspath(__file__)), ".."))

import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

from dotenv import load_dotenv, find_dotenv
from mushroom_learning.data import get_images_directory, load_validation_data, load_training_data, load_testing_data, get_labels_from_tfdataset, get_inputs_from_tfdataset, IMG_HEIGHT, IMG_WIDTH, BATCH_SIZE
from mushroom_learning.gcp import save_model_to_gcp, get_model, LOCAL_PATH_TO_MODEL
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras import optimizers
import tensorflow as tf
from tensorflow.keras.applications.vgg16 import VGG16
from tensorflow.keras import layers, models
from tensorflow.keras.callbacks import EarlyStopping
import matplotlib.pyplot as plt
from tensorflow.keras.models import Sequential
from tensorflow import keras

# point to .env file
env_path = join(dirname(abspath(__file__)),'.env') # ../.env
# load your api key as environment variables
load_dotenv(env_path)

class Trainer(object):
    def __init__(self, train_ds, val_ds, test_ds, input_shape = (224, 224, 3)):
        self.train_ds = train_ds
        self.val_ds = val_ds
        self.X_test = get_inputs_from_tfdataset(test_ds)
        self.y_test = get_labels_from_tfdataset(test_ds)
        
        self.input_shape = input_shape
        self.num_classes = len(train_ds.class_names)
        print("number of classes", self.num_classes)
    
        self.model = None
        self.history = None
        self.evaluate = None
        
    def data_augmentation(self):

        return keras.Sequential(
        [
            layers.RandomRotation(0.1),
            layers.RandomZoom(0.1),
        ]
        )
    
    def load_model(self):
        self.model = VGG16(weights="imagenet", include_top=False, input_shape=self.input_shape, classes=self.num_classes, classifier_activation="softmax")
      
    def set_nontrainable_layers(self):
        self.model.trainable = False
        return self.model

    def add_last_layers(self):
        '''Take a pre-trained model, set its parameters as non-trainables, and add additional trainable layers on top'''
        initializer = tf.keras.initializers.GlorotUniform(seed=0)
        base_model = self.set_nontrainable_layers()
        dropout_layer = layers.Dropout(0.2)
        flatten_layer = layers.Flatten()
        dense_layer_1 = layers.Dense(50, activation='relu', kernel_initializer=initializer)
        dense_layer_2 = layers.Dense(20, activation='relu', kernel_initializer=initializer)
        prediction_layer = layers.Dense(self.num_classes, activation='softmax')
        rescaling = layers.Rescaling(1./255)
        data_aug = self.data_augmentation()

        self.model = models.Sequential([
            data_aug,
            rescaling,
            base_model,
            dropout_layer, 
            flatten_layer,
            dense_layer_1,
            dense_layer_2,
            prediction_layer
        ])

    def build_model(self): 
        opt = optimizers.Adam(learning_rate=5e-4)
        
        self.model.compile(loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
                    optimizer=opt,
                    metrics=['accuracy'])

    def fit_model(self):
        es = EarlyStopping(monitor = 'val_accuracy', 
                   mode = 'max', 
                   patience = 5, 
                   verbose = 1, 
                   restore_best_weights = True)

        epochs = 100
        history = self.model.fit(self.train_ds,
                                      validation_data=self.val_ds, 
                                      epochs = epochs,
                                      verbose=1,
                                      callbacks=[es])
        
        self.history = history 
    
    def save_model(self):
        self.model.save(LOCAL_PATH_TO_MODEL)
        save_model_to_gcp()
    
    def run(self):
        self.load_model()
        self.set_nontrainable_layers()
        self.add_last_layers()
        self.build_model()
    
        self.fit_model()
    
    def evaluate(self): 
        self.model.evaluate(self.X_test, self.y_test)
    
    def plot_history(self):
        plt.plot(self.history.history['accuracy'])
        plt.plot(self.history.history['val_accuracy'])
        plt.show()

if __name__ == "__main__":
    
    print("GETTING DATA")
    data_dir = get_images_directory("../raw_data/2_12_mushroom_species_train_test/train")
    data_dir_test = get_images_directory("../raw_data/2_12_mushroom_species_train_test/test")
    
    print("LOADING DATA")
    
    train_ds = load_training_data(data_dir)
    val_ds = load_validation_data(data_dir)
    test_ds = load_testing_data(data_dir_test)
    
    # print("TRAINING")
    
    # # Train and save model, locally and on gcp 
    # trainer = Trainer(train_ds, val_ds, test_ds)
    # trainer.run()
    
    # print("SAVING MODEL")
    # trainer.save_model()
    # print("SAVED")
    
    # -------------
    
    ## PREDICTIONS

    # img_height = 224
    # img_width = 224
    # class_names = ['edable', 'poison']

    # img = tf.keras.utils.load_img(
    #     "/Users/laurameyer/Desktop/011_DoZoYI2vj20.jpg", target_size=(img_height, img_width)
    # )

    # img_array = tf.keras.utils.img_to_array(img)
    # img_array = tf.expand_dims(img_array, 0) # Create a batch

    # prediction = model.predict(img_array)
    # print(prediction)
    # classif = int(prediction > .5)
    # print(classif)
    # print(f"This image most likely belongs to {class_names[classif]} with a score of: {prediction[0][0]:.2f}")