from aiohttp import request
import streamlit as st
import matplotlib.pyplot as plt
import requests
from api.fast import create_file
import cv2 as cv
from PIL import Image
from tensorflow.keras import utils
import os

st.set_page_config(
        page_title="Mushroom Magic", # => Quick reference - Streamlit
        page_icon="🍄",
        layout="centered", # wide
        initial_sidebar_state="auto") # collapsed

'''
#           Mushroom Magic ☠️

'''


label = 'Upload your Mushroom here'

image = st.file_uploader(label, type=None, accept_multiple_files=False, key=None, help=None, on_change=None)

cols = st.columns(3)
URL = 'http://127.0.0.1:8000/predict/'

##code 1
if image:
    if cols[1].button('Identify your Mushroom'):
        file_details = {"FileName":image.name,"FileType":image.type}
        st.write(file_details)
        with open(os.path.join("/home/stella/code/DSP-Tan/mushroom_learning",'output.png'),"wb") as f:
            f.write(image.getbuffer())
        st.success("ouput")
        files = {'file':image}
        response = requests.get(URL, data=files)
        cols[1].write(response.json())



if image:
    cols[1].image(image,width=200)
