from webbrowser import get
from aiohttp import request
import streamlit as st
import matplotlib.pyplot as plt
import requests
import os
import random
import json
import io
import logging
import base64
from PIL import Image
from mushroom_learning.utils import Wiki_Api, get_wiki_image, pic_to_dict
from api.fast import check_poison_1, check_poison_2,  check_poison_3, prediction_to_streamlit

# logging.basicConfig(level = logging.INFO ,
#                     format = "%(asctime)s:%(message)s" ,
#                     filename = "errorlogs.csv")


st.set_page_config(
        page_title="Mushroom Magic", # => Quick reference - Streamlit
        page_icon="π",
        layout="centered", # wide
        initial_sidebar_state="auto") # collapsed

st.markdown("<h1 style='text-align: center; color: black;'>Mushroom Magic π</h1>", unsafe_allow_html=True)


spinner_quotes = ['βAll Fungi are edible. Some fungi are only edible once.β β Terry Pratchett',
                  'βNature alone is antique, and the oldest art a mushroom.β ~ Thomas Carlyle',
                  'A meal without mushrooms is like a day without rain. - John Cage',
                  'Advice is like mushrooms. The wrong kind can prove fatal. - Charles E. McKenzie',
                  'It\'s interesting, isn\'t it? . . . the chandelier . . . it reminds me of mushroom soup. β Tennessee Williams'
                  'Why did the mushroom go to the party? Because he\'s a fungi! β Louis Tomlinson',
                  'Look around when you have got your first mushroom or made your first discovery: they grow in clusters. β George Polya',
                  'From dead plant matter to nematodes to bacteria, never underestimate the cleverness of mushrooms to find new food! β Paul Stamets',
                  ]
#st.image(get_wiki_image('Russula nobilis')) # returning the Wikipedia image
label = 'Upload your Mushroom here'

image = st.file_uploader(label, type=None, accept_multiple_files=False, key=None, help=None, on_change=None)
st.markdown(type(image))
image = Image.open(image)
st.markdown(type(image))
buffer = io.BytesIO()
image.save(buffer, format='JPEG', quality=75)
im_bytes = buffer.getbuffer()

# with open(image, "rb") as file:
#     im_bytes = file.read()

image = base64.b64encode(im_bytes).decode("utf8")
st.markdown(type(image))
url = "https://mushroom-docker-lpuaioudtq-ew.a.run.app/image"
headers = {'Content-type': 'application/json' , 'Accept' : 'text/plain'}
payload = json.dumps({"image" : image})
result = requests.post(url , headers = headers , data = payload)

# prediction = 'Tricholoma scalpturatum'

#result = prediction_to_streamlit(check_poison_1() , check_poison_2() ,check_poison_3())
st.markdown(result.json())
size= 256,256
# if image:
#     cols = st.columns(3)
#     if cols[1].button('Identify your Mushroom'):
#         random_num = random.randint(0,len(spinner_quotes)-1)
#         with st.spinner(spinner_quotes[random_num]):
#             predict_cols = st.columns(3)

#             with predict_cols[0]:
#                 st.header("Upload")

#                 im= Image.open(image)
#                 im.thumbnail(size)
#                 st.image(image)


#             with predict_cols[1]:

#                 st.header("Prediction:")
#                 st.info(result)
#                 st.metric(label="accuracy",value='76%')


#             with predict_cols[2]:
#                 st.header("Wiki Image")
#                 st.image(get_wiki_image(result))

#             expander_cols = st.columns(3)

#             try:
#                 pass
#                 if not Wiki_Api(result)["capShape"]:
#                     pass

#                 else:
#                    pass

#                     expander_info = expander_cols[0].expander("Cap Shape:")
#                     im3= Image.open(pic_to_dict(Wiki_Api(result)["capShape"]))
#                     im3.thumbnail(size)
#                     expander_info.image(im3)

#                     expander_hydro = expander_cols[1].expander("Hymenium Shape:")
#                     im4= Image.open(pic_to_dict(Wiki_Api(result)["whichGills"]))
#                     im4.thumbnail(size)
#                     expander_hydro.image(im4)


#                     expander_ed = expander_cols[2].expander("Edible:")
#                     im5= Image.open(pic_to_dict(Wiki_Api(result)["howEdible"]))
#                     im5.thumbnail(size)
#                     expander_ed.image(im5)


#                     expander_interesting = st.expander('interesing info')
#                     expander_interesting.write('Some weird fact ')
#             except:
#                 pass





# URL_size = 'http://127.0.0.1:8000/size'
# URL_predict = 'http://127.0.0.1:8000/predict'

# random_num = random.randint(0,len(spinner_quotes)-1)









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
