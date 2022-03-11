from webbrowser import get
from aiohttp import request
import streamlit as st
import matplotlib.pyplot as plt
import requests
import os
import io
import base64
import json
import random
from PIL import Image
#from mushroom_learning.utils import Wiki_Api, get_wiki_image, pic_to_dict



#st.set_page_config(
#        page_title="Mushroom Magic", # => Quick reference - Streamlit
#        page_icon="🍄",
#        layout="centered", # wide
#        initial_sidebar_state="auto") # collapsed
#
#st.markdown("<h1 style='text-align: center; color: black;'>Mushroom Magic 🍄</h1>", unsafe_allow_html=True)
#
#
#spinner_quotes = ['“All Fungi are edible. Some fungi are only edible once.” ― Terry Pratchett',
#                  '“Nature alone is antique, and the oldest art a mushroom.” ~ Thomas Carlyle',
#                  'A meal without mushrooms is like a day without rain. - John Cage',
#                  'Advice is like mushrooms. The wrong kind can prove fatal. - Charles E. McKenzie',
#                  'It\'s interesting, isn\'t it? . . . the chandelier . . . it reminds me of mushroom soup. — Tennessee Williams'
#                  'Why did the mushroom go to the party? Because he\'s a fungi! — Louis Tomlinson',
#                  'Look around when you have got your first mushroom or made your first discovery: they grow in clusters. — George Polya',
#                  'From dead plant matter to nematodes to bacteria, never underestimate the cleverness of mushrooms to find new food! — Paul Stamets',
#                  ]
##st.image(get_wiki_image('Russula nobilis')) # returning the Wikipedia image
#label = 'Upload your Mushroom here'

#image = st.file_uploader(label, type=None, accept_multiple_files=False, key=None, help=None, on_change=None)

# Convert image to format suitable for API call, and make API call.
image = Image.open('amanita.jpg')

buffer = io.BytesIO()
image.save(buffer, format='JPEG', quality=75)
im_bytes = buffer.getbuffer()
# with open(image, "rb") as file:
#     im_bytes = file.read()
image = base64.b64encode(im_bytes).decode("utf8")

headers = {'Content-type': 'application/json' , 'Accept' : 'text/plain'}
payload = json.dumps({"image" : image})


def get_max_mush(dict_res):
    max_prob=0
    for key, value in dict_res.items():
        if key=='Other':
            continue
        if value > max_prob:
            max_res=(key,value)
            max_prob=value
    return max_res


# Call species 1
url = "https://mushroom-docker-lpuaioudtq-ew.a.run.app/species1"
predict1 = requests.post(url , headers = headers , data = payload).json()
# This is a dictionary but we had to output as a string, so use eval
# to make it a dictionary again.
result1=eval(predict1)
# Get max
max_res1=get_max_mush(result1)


# Call species 2
url = "https://mushroom-docker-lpuaioudtq-ew.a.run.app/species2"
predict2 = requests.post(url , headers = headers , data = payload).json()
result2  = eval(predict2)
max_res2=get_max_mush(result2)

print(type(result2))

# Call species 3
url = "https://mushroom-docker-lpuaioudtq-ew.a.run.app/species3"
predict3 = requests.post(url , headers = headers , data = payload).json()
result3  = eval(predict3)
max_res3=get_max_mush(result3)

ultimate_mush=get_max_mush({max_res1[0]:max_res1[1], max_res2[0]:max_res2[1], max_res3[0]:max_res3[1]})
print(ultimate_mush)

preidction = 'Amanita muscaria'

#size= 256,256
#if image:
#    cols = st.columns(3)
#    if cols[1].button('Identify your Mushroom'):
#        random_num = random.randint(0,len(spinner_quotes)-1)
#        with st.spinner(spinner_quotes[random_num]):
#            predict_cols = st.columns(3)
#
#            with predict_cols[0]:
#                st.header("Upload")
#
#                im= Image.open(image)
#                im.thumbnail(size)
#                st.image(im)
#
#
#            with predict_cols[1]:
#
#                st.header("Prediction:")
#                st.info(preidction)
#                st.metric(label="Certainty",value='66%')
#
#
#            with predict_cols[2]:
#                st.header("Wiki Image")
#                st.image(get_wiki_image(preidction))
#
#            expander_cols = st.columns(3)
#
#            try:
#                if not Wiki_Api(preidction)["capShape"]:
#                    pass
#
#                else:
#
#                    expander_info = expander_cols[0].expander("Cap Shape:")
#                    im3= Image.open(pic_to_dict(Wiki_Api(preidction)["capShape"]))
#                    im3.thumbnail(size)
#                    expander_info.image(im3)
#
#                    expander_hydro = expander_cols[1].expander("Hymenium Shape:")
#                    im4= Image.open(pic_to_dict(Wiki_Api(preidction)["whichGills"]))
#                    im4.thumbnail(size)
#                    expander_hydro.image(im4)
#
#
#                    expander_ed = expander_cols[2].expander("Edible:")
#                    im5= Image.open(pic_to_dict(Wiki_Api(preidction)["howEdible"]))
#                    im5.thumbnail(size)
#                    expander_ed.image(im5)
#
#
#                    expander_interesting = st.expander('interesing info')
#                    expander_interesting.write('''A. muscaria was used by both shamans and laypeople alike, and was used recreationally as well as religiously. In eastern Siberia,
#                                               the shaman would take the mushrooms, and others would drink his urine. This urine, still containing psychoactive elements,
#                                               may be more potent than the A. muscaria mushrooms with fewer
#                                               negative effects such as sweating and twitching, suggesting that the initial user may act as a screening
#                                               filter for other components in the mushroom.''')
#            except:
#                pass
#
#
#
#
#
#URL_size = 'http://127.0.0.1:8000/size'
#URL_predict = 'http://127.0.0.1:8000/predict'
#
#random_num = random.randint(0,len(spinner_quotes)-1)
#
#
#
#
#
#
#
#
#
#        # with st.spinner(spinner_quotes[random_num]):
#
#        #     # It seems that making a temporary file with a path to pass to the
#        #     # API is the easiest way to currently do this. There is probably
#        #     # a way to do it without doing this, maybe just by
#        #     # image.getbuffer() straight to the API or something.
#
#        #     image_path=os.path.join(os.getcwd(),'temp_img')
#        #     with open(image_path,"wb") as f:
#        #         f.write(image.getbuffer())
#
#        #     files = {'mush': image_path  }
#
#        #     response = requests.get(URL_predict,data=files)
#        #     cols[1].write(response.json())
