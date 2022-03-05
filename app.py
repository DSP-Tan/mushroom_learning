from aiohttp import request
import streamlit as st
import matplotlib.pyplot as plt
import requests
from api.fast import create_file
import os
import random

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

spinner_quotes = ['“All Fungi are edible. Some fungi are only edible once.” ― Terry Pratchett',
                  '“Nature alone is antique, and the oldest art a mushroom.” ~ Thomas Carlyle',
                  'A meal without mushrooms is like a day without rain. - John Cage',
                  'Advice is like mushrooms. The wrong kind can prove fatal. - Charles E. McKenzie',
                  'It\'s interesting, isn\'t it? . . . the chandelier . . . it reminds me of mushroom soup. — Tennessee Williams'
                  'Why did the mushroom go to the party? Because he\'s a fungi! — Louis Tomlinson',
                  'Look around when you have got your first mushroom or made your first discovery: they grow in clusters. — George Polya',
                  'From dead plant matter to nematodes to bacteria, never underestimate the cleverness of mushrooms to find new food! — Paul Stamets',
                  'Compliments are like mushrooms, the most beautiful are the most poisonous. - italian proverb'
                  ]

random_num = random.randint(0,len(spinner_quotes)-1)

if image:
    if cols[1].button('Identify your Mushroom'):
        with st.spinner(spinner_quotes[random_num]):
            file_details = {"FileName":image.name,"FileType":image.type}
            # st.write(file_details)
            with open(os.path.join("/home/stella/code/DSP-Tan/mushroom_learning",'output.png'),"wb") as f:
                f.write(image.getbuffer())
            files = {'file':image}
            response = requests.get(URL, data=files)
            cols[1].write(response.json())


if image:
    cols[1].image(image,width=200)
