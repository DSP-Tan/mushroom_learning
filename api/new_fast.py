import os
import io
import tensorflow as tf
import base64
import random
import cv2        as cv
import numpy      as np

from fastapi                  import FastAPI,File, UploadFile, Request
from fastapi.middleware.cors  import CORSMiddleware

import json
from PIL import Image
from tensorflow               import keras
from tensorflow.keras         import utils




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


# Check file size in Kbytes
@app.post("/size")
def check_size(mush: bytes = File(...)):
    #Check type of image as it arrives.
    print(
         f'''
         --------------------------------------------------------------\n
         --------------------------------------------------------------\n
         \n\n\nAfter being passed to API, file has tpye: {type(mush)}\n
         The file has length {len(mush)}
         '''
         )
    # convert to bytes with bytearray, and to np array
    #image = np.asarray(bytearray(mush), dtype="uint8")
    decoded_mush=base64.decodebytes(mush)

    return f'This file is {len(decoded_mush)/1000} Kbytes and type {type(decoded_mush)}'


#Api poison predict request
@app.post("/poison")
async def check_poison(request: Request):
    request_body = await request.json()
    image_b64_utf8 = request_body["image"]
    img_exp = new_preproc(image_b64_utf8)
    

    # Load the model.
    model=keras.models.load_model('model_poison_vgg19_72/')
    # Predict.
    results = model.predict(img_exp)
    # Print the results.

    class_names = ['edible', 'poisonous']
    classif = int(results > .5)
    output = f"This mushroom is most likely {class_names[classif]}. Score: {results[0][0]:.2f}"
    return output

#Api species request
@app.post("/species")
async def check_species(request: Request):
    
    request_body = await request.json()
    image_b64_utf8 = request_body["image"]
    img_exp = new_preproc(image_b64_utf8)
    
    # Temporary stop gap.
    probability=99.9999999999
    names={'amanita_muscaria', 'amanita_virosa', 'boletus_edulis', 'cantharellus_cibarius', 'russula_mairei', 'trametes_versicolor'}
    name = random.choice(tuple(names))
    # random item from set
    print(name)
    # Output 65

    return (name,probability)

@app.post("/image")
async def process_image(request: Request):
    request_body = await request.json()
    image_b64_utf8 = request_body["image"]
    img_exp = new_preproc(image_b64_utf8)

    model=keras.models.load_model('model_poison_vgg19_72/')
    
    # Print the results.
    results = model.predict(img_exp)
    class_names = ['edible', 'poisonous']
    classif = int(results > .5)
    output = f"This mushroom is most likely {class_names[classif]}. Score: {results[0][0]:.2f}"
    return output
    

def new_preproc(image_b64_utf8):
    size=(224,224)
    
    img_bytes = base64.b64decode(image_b64_utf8.encode('utf8'))

    # # convert bytes data to PIL Image object
    img = Image.open(io.BytesIO(img_bytes))
    img_arr = np.asarray(img)

    img_rs=tf.image.resize(img_arr,size, method=tf.image.ResizeMethod.NEAREST_NEIGHBOR)
    img_exp = tf.expand_dims(img_rs, 0)
    return img_exp


# Take image from bits to model-ready
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
