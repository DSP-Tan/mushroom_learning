
from fastapi import FastAPI,File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from mushroom_learning.gcp import get_model
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
    im_API=bits_to_model(file)

    results = model.predict(im_API)
    class_names = ['edible', 'poisonous']
    classif = int(results > .5)
    output = f"This mushroom is most likely {class_names[classif]}. Score: {results[0][0]:.2f}"
    return output




def bits_to_model(bits):
    # The model expects an image of this size
    size=(224,224)
    # Convert bits to bytes
    im_API=np.asarray(bytearray(bits), dtype="uint8")
    # decode byte array back into image, and then adjust
    # for cv's automatic BGR representation
    im_API = cv.imdecode(im_API,cv.IMREAD_COLOR)
    im_API = cv.cvtColor(im_API , cv.COLOR_BGR2RGB)

    # resize using tensor flow with nearest neighbour interpolation
    im_API=tf.image.resize(im_API,size, method=tf.image.ResizeMethod.NEAREST_NEIGHBOR)
    # Expand for CNN
    im_API = tf.expand_dims(im_API, 0)

    return im_API
