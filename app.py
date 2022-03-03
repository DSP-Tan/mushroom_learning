import streamlit as st
import matplotlib.pyplot as plt
import requests
from api.fast import create_file

#url = 'https://taxifare.lewagon.ai/predict' --> to be updated with Stella

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
if image:
    if cols[1].button('Identify your Mushroom'):
        response = create_file(image)
        cols[1].write(response)



if image:
    cols[1].image(image,width=200)
