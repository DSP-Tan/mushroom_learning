import os
import io
import tensorflow as tf
import base64
import random
import cv2        as cv
import numpy      as np
import pandas     as pd
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
# @app.post("/poison")
# def check_poison(mush: bytes = File(...)):
#     # decode Base64 encoded bytes
#     decoded_mush=base64.decodebytes(mush)

#     # preprocess for image to be in form required by model
#     im_API=bits_to_model(decoded_mush)

#     # Load the model.
#     model=keras.models.load_model('model_poison_vgg19_72/')

#     # Print the results.
#     results = model.predict(im_API)
#     class_names = ['edible', 'poisonous']
#     classif = int(results > .5)
#     output = f"This mushroom is most likely {class_names[classif]}. Score: {results[0][0]:.2f}"
#     return output



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


@app.post("/species3")
def check_poison_3(mush: bytes = File(...)):
    # decode Base64 encoded bytes
    decoded_mush=base64.decodebytes(mush)

    # preprocess for image to be in form required by model
    im_API = bits_to_model(decoded_mush)

    #Get the models prediction
    model_3 = keras.models.load_model('model_3_species_vgg16')
    prediction_3 = model_3.predict(im_API)
    prediction_3 = prediction_3.pop(-1)
    return prediction_3

@app.post("/image")
async def process_image(request: Request):
    print(request)
    print(type(request))
    size=(224,224)

    request_body = await request.json()
    image_b64_utf8 = request_body["image"]
    img_bytes = base64.b64decode(image_b64_utf8.encode('utf8'))
    # # convert bytes data to PIL Image object
    img = Image.open(io.BytesIO(img_bytes))
    print(img)
    img_arr = np.asarray(img)
    print(img_arr)
    print('img shape', img_arr.shape)
    img_rs=tf.image.resize(img_arr,size, method=tf.image.ResizeMethod.NEAREST_NEIGHBOR)
    img_exp = tf.expand_dims(img_rs, 0)
    print(img_rs)
    print(img_exp)
    model=keras.models.load_model('model_poison_vgg19_72/')

    # Print the results.
    results = model.predict(img_exp)
    class_names = ['edible', 'poisonous']
    classif = int(results > .5)
    output = f"This mushroom is most likely {class_names[classif]}. Score: {results[0][0]:.2f}"
    return output


@app.get("/species1")
def check_poison_1(mush: bytes = File(...)):
    # decode Base64 encoded bytes
    with open(mush , 'rb') as file:
        mush = file.read()
    decoded_mush=base64.b64encode(mush)
    #decoded_mush = bytearray(mush)

    # preprocess for image to be in form required by model
    im_API=bits_to_model(decoded_mush)

    #Get the models prediction
    model_1 = keras.models.load_model('model_2_species_vgg16')
    prediction_1 = model_1.predict(im_API)
    prediction_1 = prediction_1.pop(-1)
    return prediction_1

@app.post("/species2")
def check_poison_2(mush: bytes = File(...)):
    # decode Base64 encoded bytes
    decoded_mush=base64.decodebytes(mush)

    # preprocess for image to be in form required by model
    im_API = bits_to_model(decoded_mush)

    #Get the models prediction
    model_2 = keras.models.load_model('model_2_species_vgg16')
    prediction_2 = model_2.predict(im_API)
    prediction_2 = prediction_2.pop(-1)
    return prediction_2



def prediction_to_streamlit(pred_1,pred_2,pred_3):
    mushrooms = ['Agaricus_arvensis', 'Agaricus_impudicus', 'Amanita_muscaria', 'Amanita_virosa', 'Armillaria_lutea', 'Auricularia_auricula_judae', 'Basidioradulum_radula', 'Boletus_edulis', 'Byssomerulius_corium','Cantharellus_cibarius','Cerioporus_squamosus','Cerioporus_varius','Coprinellus_micaceus','Cortinarius_elatior','Cortinarius_flexipes','Cortinarius_malicorius','Cortinarius_torvus','Cuphophyllus_virgineus','Cylindrobasidium_laeve','Fomes_fomentarius','Fomitopsis_pinicola','Ganoderma_applanatum','Ganoderma_pfeifferi','Hericium_erinaceus','Hypholoma_fasciculare', 'Leccinum_scabrum', 'Mycena_galericulata', 'Plicatura_crispa', 'Pluteus_cervinus', 'Psathyrella_candolleana', 'Russula_mariae', 'Trametes_versicolor', 'Tricholoma_scalpturatum', 'Xerocomellus_chrysenteron', 'Xerocomus_ferrugineus', 'Xylodon_paradoxus']
    all_predictions = np.concatenate([pred_1,pred_2,pred_3],axis=1)
    max_value = np.argmax(all_predictions)
    predicted_mushroom = mushrooms[max_value]
    return max_value, predicted_mushroom
