from fastapi import FastAPI, File, UploadFile
import numpy as np
import PIL
from PIL import Image

app = FastAPI()

# define a root `/` endpoint
@app.get("/")
def index():
    return {"ok": "fart"}

@app.post("/")
def post_wrap():
    return('You have used the post thing.')


@app.post("/files/")
async def create_file(file: bytes = File(...)):
    # convert to bytes with bytearray, and to np array
    image = np.asarray(bytearray(file), dtype="uint8")
    #decode_img = cv.imdecode(from_bits_to_array,cv.IMREAD_COLOR)
    #image=PIL.Image.open(file)
    #image_array = np.array(image)

    return image.shape
    #return {"file_size": len(file)}


@app.get("/predict")
def predict(number, time):
    # compute `wait_prediction` from `day_of_week` and `time`
    return f'Here is a \n. here is the number squared {int(number)**2}'
    #return {'day_of_week': day_of_week,
            #'time':time}
