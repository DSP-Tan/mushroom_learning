#from mushroom_learning.data import load_training_data, load_validation_data
from mushroom_learning.params import BUCKET_NAME, STORAGE_LOCATION
from tensorflow.keras.models import Sequential
from google.cloud import storage
from tensorflow.keras import layers
import tensorflow as tf
from tensorflow import keras

class Trainer(object):
    def __init__(self, train, val):  
        self.train = train
        self.val = val
        
    # def augmentation(self):
    #     return keras.Sequential(
    #         [
    #             layers.RandomFlip("horizontal",
    #                   input_shape=(img_height,
    #                               img_width,
    #                               3)),
    #             layers.RandomRotation(0.1),
    #             layers.RandomZoom(0.1),
    #         ]
    #     )
    
    # def initiate_model(self):
    #     img_height = 224
    #     img_width = 224
    #     augmentation = augmentation()
        
    #     model = Sequential([
    #         augmentation,
    #         layers.Rescaling(1./255, input_shape=(img_height, img_width, 3)),
    #         layers.Conv2D(16, 3, padding='same', activation='relu'),
    #         layers.MaxPooling2D(),
    #         layers.Conv2D(32, 3, padding='same', activation='relu'),
    #         layers.MaxPooling2D(),
    #         layers.Conv2D(64, 3, padding='same', activation='relu'),
    #         layers.MaxPooling2D(),
    #         layers.Dropout(0.2),
    #         layers.Flatten(),
    #         layers.Dense(128, activation='relu'),
    #         layers.Dense(1, activation='sigmoid')
    #     ])
        
    #     opt = keras.optimizers.Adam(learning_rate=1e-4)

    #     model.compile(optimizer=opt,
    #         loss=tf.keras.losses.BinaryCrossentropy(from_logits=True),
    #         metrics=['accuracy']
    #     )  
    
def upload_model_to_gcp():
    client = storage.Client()
    bucket = client.bucket(BUCKET_NAME)
    blob = bucket.blob(STORAGE_LOCATION)
    blob.upload_from_filename('../our_first_model')
    print(f"uploaded model.joblib to gcp cloud storage under \n => {STORAGE_LOCATION}")
    
def save_model(model):
    """method that saves the model into a .joblib file and uploads it on Google Storage /models folder
    HINTS : use joblib library and google-cloud-storage"""

    # saving the trained model to disk is mandatory to then beeing able to upload it to storage
    # Implement here
    model.save("../our_first_model")
                
if __name__ == "__main__":
    #train_ds = load_training_data()
    #val_ds = load_validation_data()
    #trainer = Trainer(train=train_ds, val=val_ds)
   # model = keras.models.load_model('path/to/location')
    upload_model_to_gcp()
