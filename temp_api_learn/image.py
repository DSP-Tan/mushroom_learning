from fastapi import FastAPI, File, UploadFile
import numpy as np
import PIL
from PIL import Image

image=PIL.Image.open("amanita.jpg")
image_array = np.array(image)

print(image_array.shape)


