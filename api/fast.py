import os
import io
import tensorflow as tf
import PIL
import cv2        as cv
import numpy      as np

from fastapi                  import FastAPI,File, UploadFile
from fastapi.middleware.cors  import CORSMiddleware
from mushroom_learning.gcp    import get_model

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
@app.get("/size")
def check_size(mush: bytes = File(...)):
    # convert to bytes with bytearray, and to np array
    image = np.asarray(bytearray(mush), dtype="uint8")

    return f'This file is {len(image)/1000} Kbytes'

@app.post("/uploadfile/")
async def create_upload_file(mush: UploadFile):
    return {"filename": mush.filename}


#Api predict request
@app.get("/predict")
def create_file(mush: bytes = File(...)):

    #with open(mush, 'rb') as f:
    #    im_API = f.read()
    im_API=bits_to_model(mush)

    model = get_model()
    results = model.predict(im_API)
    class_names = ['edible', 'poisonous']
    classif = int(results > .5)
    output = f"This mushroom is most likely {class_names[classif]}. Score: {results[0][0]:.2f}"
    return output



# Take image from bits to model-ready
def bits_to_model(bits):
    # The model expects an image of this size
    size=(224,224)
    print('In bits to model')
    print(f'{len(bits)} {type(bits)}\n\n\n')
    
    #image_path=os.path.join(os.getcwd(),'anus.fart')
    #with open(image_path,"wb") as f:
    #    f.write(bits)
    #print('bytes written to file')
    
    #bytes = bits
    #f = open("anus.jpg", "wb")
    #f.write(bytes)
    #f.close()


    # creating a image object (main image)
    #print(f'\n\n\ntry to open with PIL')
    #im_API=PIL.Image.open(bits)
    #print(f'{len(im_API)} {type(im_API)}\n\n\n')
    # save a image using extension
    #bits.save("geeks.jpg")

    # Convert bits to bytes
    im_API=np.asarray(bytearray(bits), dtype="uint8")
    print('\n\n\nConvert to bytes')
    print(f'{len(im_API)} {type(im_API)}\n\n\n')
    
    # Decoding with PIL
    #print('Try pre PIL step')
    #im_API = PIL.Image.frombuffer("I;16", (5, 10), im_API, "raw", "I;12")
    #print(f'{len(im_API)} {type(im_API)}\n\n\n')

    #print('Start decoding with PIL')
    #im_API = PIL.Image.open( io.BytesIO(im_API).seek(0) )
    
    #print(f'\n\n\n{len(im_API)} {type(im_API)}\n\n\n')
    #im_API = np.asarray(im_API)

    # decode byte array back into image, and then adjust
    # for cv's automatic BGR representation
    print(cv.imdecode(im_API,cv.IMREAD_COLOR))
    im_API = cv.imdecode(im_API,cv.IMREAD_COLOR)
    print(f'\n\n\n{len(im_API)} {type(im_API)}\n\n\n')
    im_API = cv.cvtColor(im_API , cv.COLOR_BGR2RGB)

    # resize using tensor flow with nearest neighbour interpolation
    im_API=tf.image.resize(im_API,size, method=tf.image.ResizeMethod.NEAREST_NEIGHBOR)

    # Expand for CNN
    im_API = tf.expand_dims(im_API, 0)

    return im_API
