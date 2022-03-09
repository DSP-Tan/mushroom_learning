from aiohttp import request
import streamlit as st
import matplotlib.pyplot as plt
import requests
from api.fast import create_file
import os
import random
from mushroom_learning.utils import get_wiki_image, Wiki_Api
from IPython.core.display import HTML

URL = 'http://127.0.0.1:8000/predict/'
# URL = 'https://mushroom-docker-lpuaioudtq-ew.a.run.app/size/'

spinner_quotes = ['“All Fungi are edible. Some fungi are only edible once.” ― Terry Pratchett',
                  '“Nature alone is antique, and the oldest art a mushroom.” ~ Thomas Carlyle',
                  'A meal without mushrooms is like a day without rain. - John Cage',
                  'Advice is like mushrooms. The wrong kind can prove fatal. - Charles E. McKenzie',
                  'It\'s interesting, isn\'t it? . . . the chandelier . . . it reminds me of mushroom soup. — Tennessee Williams'
                  'Why did the mushroom go to the party? Because he\'s a fungi! — Louis Tomlinson',
                  'Look around when you have got your first mushroom or made your first discovery: they grow in clusters. — George Polya',
                  'From dead plant matter to nematodes to bacteria, never underestimate the cleverness of mushrooms to find new food! — Paul Stamets',
                  ]

st.set_page_config(
        page_title="Mushroom Magic",
        page_icon="🍄",
        layout="wide",
        initial_sidebar_state="auto")


c1, c2, c3 = st.columns((1,4,1))
c2.markdown("<h1 style='text-align: center; color: black;'>Mushroom Magic 🍄</h1>", unsafe_allow_html=True)
label = 'Upload your Mushroom here'
user_image = c2.file_uploader(label, type=None, accept_multiple_files=False, key=None, help=None, on_change=None)

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


with c2:
    random_num = random.randint(0,len(spinner_quotes)-1)
    if user_image:
        if c2.button('Identify your Mushroom'):
            with st.spinner(spinner_quotes[random_num]):
                with open(os.path.join("/home/stella/code/DSP-Tan/mushroom_learning",'output.png'),"wb") as f:
                    f.write(user_image.getbuffer())
                files = {'file':user_image}
                response = requests.get(URL, data=files)
                c2.write(response.json())
                c2.image(user_image,width=500)
                # WIKI information
                # expander_label = c2.markdown("<h1 style='text-align: center; color: black;'>Learn about your mushroom</h1>", unsafe_allow_html=True)
                with st.expander('Learn about your mushroom'):
                    # Wiki dictionary here
                    wiki_dict = Wiki_Api("Russula nobilis")
                    st.write(wiki_dict)
                    # wiki image here
                    c2.image(get_wiki_image("Russula nobilis"),width=200)



# if image:
#     cols[3].image(image,width=200)
