from google.cloud import storage
import pandas as pd 
from mushroom_learning.params import BUCKET_NAME, BUCKET_TRAIN_DATA_PATH

def get_data_from_gcp(nrows=10000, optimize=False, **kwargs):
    """method to get the training data (or a portion of it) from google cloud bucket"""
    # Add Client() here
    client = storage.Client()
    path = f"gs://{BUCKET_NAME}/{BUCKET_TRAIN_DATA_PATH}"
    df = pd.read_csv(path, nrows=nrows)
    return df 


if __name__ == '__main__':
    df = get_data_from_gcp()
