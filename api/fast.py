from black import out
from fastapi import FastAPI,File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from mushroom_learning.gcp import load_from_gcp
from tensorflow.keras import utils
import tensorflow as tf
from tensorflow import keras
import cv2 as cv
import numpy as np


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Check root.
@app.get("/")
def index():
    return {"Don't eat that mushroom!"}

#Api request
@app.get("/predict")
def create_file(file: bytes = File(...)):
    #The file is in bytes format. Convert byte to bits.
    from_byte_to_bits = bytearray(file)
    # # # # #Convert bits to array.
    from_bits_to_array = np.asarray(from_byte_to_bits, dtype="uint8")
    # # # #Decode the array to image. This will be used from the model.
    decode_img = cv.imdecode(from_bits_to_array,cv.IMREAD_COLOR)
    # # # #Save the image. Just to check it
    # cv.imwrite('output.png',decode_img)

    model = load_from_gcp()

    # # # # # make prediction
    img_height = 224
    img_width = 224
    decode_img_reshaped = tf.keras.utils.load_img('output.png', target_size=(img_height, img_width))
    # # # decode_img_reshaped = cv.resize(decode_img, (img_height, img_width))
    img_array = tf.keras.utils.img_to_array(decode_img_reshaped)
    img_array_expand = tf.expand_dims(img_array, 0) # Create a batch
    results = model.predict(img_array_expand)
    class_names = ['edible', 'poisonous']
    classif = int(results > .5)
    output = f"This mushroom is most likely {class_names[classif]}. Score: {results[0][0]:.2f}"
    return output
