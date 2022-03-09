import tensorflow as tf
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
async def create_file(mush: bytes = File(...)):
    # convert to bytes with bytearray, and to np array
    image = np.asarray(bytearray(mush), dtype="uint8")

    return f'This file is {len(image)/1000} Kbytes'



#Api predict request
@app.get("/predict")
<<<<<<< HEAD
def create_file(file: bytes = File(...)):
    #The file is in bytes format. Convert byte to bits.
    # from_byte_to_bits = bytearray(file)
    # # # # # #Convert bits to array.
    # from_bits_to_array = np.asarray(from_byte_to_bits, dtype="uint8")
    # # # # #Decode the array to image. This will be used from the model.
    # decode_img = cv.imdecode(from_bits_to_array,cv.IMREAD_COLOR)
    # # # # #Save the image. Just to check it
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
=======
def create_file(mush: bytes = File(...)):

    with open(mush, 'rb') as f:
        im_API = f.read()
    im_API=bits_to_model(im_API)

    model = get_model()
    results = model.predict(im_API)
>>>>>>> 9f3483a068089ca3f03e4c53706d52dd70fcdc0a
    class_names = ['edible', 'poisonous']
    classif = int(results > .5)
    output = f"This mushroom is most likely {class_names[classif]}. Score: {results[0][0]:.2f}"
    return output



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
