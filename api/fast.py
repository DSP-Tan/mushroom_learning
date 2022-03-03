from fastapi import FastAPI,File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
# from git import Blob
from mushroom_learning.gcp import load_from_gcp
from tensorflow.keras import utils
import tensorflow as tf
from tensorflow import keras
from numpy import bitwise_not
import pandas as pd
# import cv2
from cv2 import cv2
import numpy as np

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all methods
    allow_headers=["*"],  # Allows all headers
)

# Check root.
@app.get("/")
def index():
    return {"Don't eat that mushroom!"}

#Api request
@app.get("/predict")
def create_file(file: bytes = File(...)):
    #The file is in bytes format. Convert byte to bits.
    # print(file[0:100])
    from_byte_to_bits = bytearray(file)
    #Convert bits to array. You can use
    from_bits_to_array = np.asarray(from_byte_to_bits, dtype="uint8")
    #Decode the array to image. This will be used from the model.
    decode_img = cv2.imdecode(from_bits_to_array,cv2.IMREAD_COLOR)
    # print(type(decode_img))
    #Save the image. Just to check it
    # cv2.imwrite('output.png',decode_img)

    model = load_from_gcp()

    # # make prediction
    img_height = 224
    img_width = 224
    # decode_img_reshaped = tf.keras.utils.load_img('output.png', target_size=(img_height, img_width)) #Not necessary anymore
    decode_img_reshaped = cv2.resize(decode_img, (img_height, img_width))
    # img_array = tf.keras.utils.img_to_array(decode_img_reshaped)
    img_array = tf.expand_dims(decode_img_reshaped, 0) # Create a batch
    results = model.predict(img_array)
    class_names = ['edible', 'poisonous']
    classif = int(results > .5)
    output = f"This mushroom is most likely {class_names[classif]}. Score: {results[0][0]:.2f}"
    return output
