from mushroom_learning.params import BUCKET_NAME, STORAGE_LOCATION


# PLEASE CHANGE WHEN CHANGING MODEL
LOCAL_STORAGE_PATH =  "../our_first_model"


def get_model():
    '''
    This retrieves a model from our local storage.
    '''
    print(LOCAL_STORAGE_PATH)
    return keras.models.load_model(LOCAL_STORAGE_PATH)


