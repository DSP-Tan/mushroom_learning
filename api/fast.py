from fastapi import FastAPI,File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
# from git import Blob
import joblib
import pandas as pd


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all methods
    allow_headers=["*"],  # Allows all headers
)

# Check root endpoint.
@app.get("/")
def index():
    return {"Don't eat that mushroom!"}

#Api request
@app.get("/predict")
def create_file(file: bytes = file()):

    # Turn bytes to image.

    # Creat the Dataframe
    # X = pd.DataFrame()

    # pipeline = get_model_from_gcp()
    pipeline = joblib.load('model.joblib')

    # make prediction
    results = pipeline.predict(X)

    # convert response from numpy to python type
    pred = str(results[0])

    return pred
