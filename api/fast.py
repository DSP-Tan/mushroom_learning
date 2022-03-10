import os
import io
import tensorflow as tf
import base64
import random
import cv2        as cv
import numpy      as np

from fastapi                  import FastAPI,File, UploadFile
from fastapi.middleware.cors  import CORSMiddleware

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
@app.get("/poison")
def check_poison(mush: bytes = File(...)):
    # decode Base64 encoded bytes
    decoded_mush=base64.decodebytes(mush)

    # preprocess for image to be in form required by model
    im_API=bits_to_model(decoded_mush)
    
    # Confirm we have the correct type here.
    im_type=type(im_API); shape=im_API.shape; descrip='Tensorflow expanded image'
    print(f'{descrip:26} {str(im_type):56} {str(shape):30}')
    
    # Load the model.
    print(f'\n\n---------------------------------------')
    print('Load model')
    print(f'-------------------------------------------\n\n')
    model=keras.models.load_model('our_first_model/')
    
    # Print the results.
    results = model.predict(im_API)
    class_names = ['edible', 'poisonous']
    classif = int(results > .5)
    output = f"This mushroom is most likely {class_names[classif]}. Score: {results[0][0]:.2f}"
    return output

#Api species request
@app.get("/species")
def check_species(mush: bytes = File(...)):
    # decode Base64 encoded bytes
    decoded_mush=base64.decodebytes(mush)

    # preprocess for image to be in form required by model
    im_API=bits_to_model(decoded_mush)
    
    # Temporary stop gap.
    probability=99.9999999999
    names={'amanita_muscaria', 'amanita_virosa', 'boletus_edulis', 'cantharellus_cibarius', 'russula_mairei', 'trametes_versicolor'}
    name = random.choice(tuple(names))
    # random item from set
    print(name)
    # Output 65

    return (name,probability)

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



