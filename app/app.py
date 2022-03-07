from aiohttp import request
import streamlit as st
import matplotlib.pyplot as plt
import requests
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
URL_size = 'http://127.0.0.1:8000/size'
URL_predict = 'http://127.0.0.1:8000/predict'



spinner_quotes = ['“All Fungi are edible. Some fungi are only edible once.” ― Polish/Croatian proverb',
                  '“Nature alone is antique, and the oldest art a mushroom.” ~ Thomas Carlyle',
                  'A meal without mushrooms is like a day without rain. - John Cage',
                  'Advice is like mushrooms. The wrong kind can prove fatal. - Charles E. McKenzie',
                  'It\'s interesting, isn\'t it? . . . the chandelier . . . it reminds me of mushroom soup. — Tennessee Williams'
                  'Why did the mushroom go to the party? Because he\'s a fungi! — Louis Tomlinson',
                  'Look around when you have got your first mushroom or made your first discovery: they grow in clusters. — George Polya',
                  'From dead plant matter to nematodes to bacteria, never underestimate the cleverness of mushrooms to find new food! — Paul Stamets',
                  'Compliments are like mushrooms, the most beautiful are the most poisonous. - Italian proverb',
                  "One who is noisy in the wood, scares away mushrooms. - Russian proverb"
                  ]
# Lot's of nice proverbs here: https://quoteproverbs.com/mushrooms/
# On googling the first quote is not actually by Terry prachett but is a proverb.

random_num = random.randint(0,len(spinner_quotes)-1)

if image:
    cols[1].image(image,width=200)


if image:
    if cols[1].button('Identify your Mushroom'):
        with st.spinner(spinner_quotes[random_num]):

            # It seems that making a temporary file with a path to pass to the
            # API is the easiest way to currently do this. There is probably
            # a way to do it without doing this, maybe just by
            # image.getbuffer() straight to the API or something.

            image_path=os.path.join(os.getcwd(),'temp_img')
            with open(image_path,"wb") as f:
                f.write(image.getbuffer())

            files = {'mush': image_path  }

            response = requests.get(URL_predict,data=files)
            cols[1].write(response.json())
