from fastapi import FastAPI,File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
# from git import Blob
import joblib

from numpy import bitwise_not
import pandas as pd
import cv2 #decoding with opencv
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

    # pipeline = get_model_from_gcp()
    # pipeline = joblib.load('model.joblib')

    # # make prediction
    # results = pipeline.predict(X)
    # pred = str(results[0])

    return decode_img.shape
