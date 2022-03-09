from webbrowser import get
from aiohttp import request
import streamlit as st
import matplotlib.pyplot as plt
import requests
import os
import random
from mushroom_learning.utils import Wiki_Api, get_wiki_image, pic_to_dict


st.set_page_config(
        page_title="Mushroom Magic", # => Quick reference - Streamlit
        page_icon="🍄",
        layout="centered", # wide
        initial_sidebar_state="auto") # collapsed

st.markdown("<h1 style='text-align: center; color: black;'>Mushroom Magic 🍄</h1>", unsafe_allow_html=True)

m = st.markdown("""
<style>
div.stButton > button:first-child {
    box-shadow: 3px 4px 0px 0px #899599;
	background:linear-gradient(to bottom, #ededed 5%, #bab1ba 100%);
	background-color:#ededed;
	border-radius:15px;
	border:1px solid #d6bcd6;
	display:inline-block;
	cursor:pointer;
	color:#3a8a9e;
	font-family:Arial;
	font-size:18px;
	padding:7px 25px;
	text-decoration:none;
	text-shadow:0px 1px 0px #e1e2ed;
}
</style>""", unsafe_allow_html=True)

spinner_quotes = ['“All Fungi are edible. Some fungi are only edible once.” ― Terry Pratchett',
                  '“Nature alone is antique, and the oldest art a mushroom.” ~ Thomas Carlyle',
                  'A meal without mushrooms is like a day without rain. - John Cage',
                  'Advice is like mushrooms. The wrong kind can prove fatal. - Charles E. McKenzie',
                  'It\'s interesting, isn\'t it? . . . the chandelier . . . it reminds me of mushroom soup. — Tennessee Williams'
                  'Why did the mushroom go to the party? Because he\'s a fungi! — Louis Tomlinson',
                  'Look around when you have got your first mushroom or made your first discovery: they grow in clusters. — George Polya',
                  'From dead plant matter to nematodes to bacteria, never underestimate the cleverness of mushrooms to find new food! — Paul Stamets',
                  ]
#st.image(get_wiki_image('Russula nobilis')) # returning the Wikipedia image
label = 'Upload your Mushroom here'

image = st.file_uploader(label, type=None, accept_multiple_files=False, key=None, help=None, on_change=None)

col1, col2, col3 = st.columns(3)

with col1:
    st.header("Cape Shape")
    st.image(pic_to_dict(Wiki_Api('Amanita virosa')["capShape"]),width =200)

with col2:
    st.header("Hymenium")
    st.image(pic_to_dict(Wiki_Api('Amanita virosa')["whichGills"]),width =200)

with col3:
    st.header("Edible")
    st.image(pic_to_dict(Wiki_Api('Amanita virosa')["howEdible"]),width =200)




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
    cols = st.columns(2)
    if col1.button('Identify your Mushroom'):
        with st.spinner(spinner_quotes[random_num]):

            with col1:
                st.header("Wiki Image")
                st.image(get_wiki_image('Amanita virosa'),width=200)

            with col2:
                st.header("Upload")
                st.image(image,width=200)








        # with st.spinner(spinner_quotes[random_num]):

        #     # It seems that making a temporary file with a path to pass to the
        #     # API is the easiest way to currently do this. There is probably
        #     # a way to do it without doing this, maybe just by
        #     # image.getbuffer() straight to the API or something.

        #     image_path=os.path.join(os.getcwd(),'temp_img')
        #     with open(image_path,"wb") as f:
        #         f.write(image.getbuffer())

        #     files = {'mush': image_path  }

        #     response = requests.get(URL_predict,data=files)
        #     cols[1].write(response.json())
