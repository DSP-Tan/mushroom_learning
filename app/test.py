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
from mushroom_learning.utils import Wiki_Api, get_wiki_image, pic_to_dict

#To do: move this to utils.
def get_max_mush(dict_res,other=True, weights=[1,1,1]):
    '''
    This will return the dicionary item of the species
    with the highest score. If other is set to True this
    includes the 'Other' species, if it is set to false
    the other is not included.

    The weights have to be set to the accuracy/or some metric
    of each model, so that later on you do not take as the maximum
    score a high score from a bad model.

    The weights only come into play after you first find the maximum,
    so the implementation is not as straight forward as it seems. You
    could just have an option where the weights are only applied when
    a certain flag is given. Anyway, for now we do not have the weights
    and so we will continue without them but with this reminder.
    '''
    max_prob=0
    for key, value in dict_res.items():
        if key=='Other':
            continue
        if value > max_prob:
            max_res=(key,value)
            max_prob=value
    return max_res


st.set_page_config(
        page_title="Mushroom Magic", # => Quick reference - Streamlit
        page_icon="🍄",
        layout="centered", # wide
        initial_sidebar_state="auto") # collapsed

st.markdown("<h1 style='text-align: center; color: black;'>Mushroom Magic 🍄</h1>", unsafe_allow_html=True)


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

# Convert image to format suitable for API call, and make API call.
if(image):
    im_PIL = Image.open(image)

    img_path="temp.jpg"
    im_PIL.save(img_path)

    # Set up image Jerome's way.
    with open(img_path, "rb") as f:
        im_bytes = f.read()
    im_b64 = base64.b64encode(im_bytes).decode("utf8")
    headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
    payload = json.dumps({"image": im_b64})

    # store results in a list of dicts.
    results=[]
    maxes=[]
    for i in [1, 2, 3]:
        url="https://mushroom-docker-lpuaioudtq-ew.a.run.app/species"+str(i)
        predict=requests.post(url , headers = headers , data = payload).json()
        # Prediction is output as str, eval returns it to dict.
        result=eval(predict)
        max_mush=get_max_mush(result)
        maxes.append(max_mush)
        print(f"\n\nThe out put of model {i} is :\n{result}\nThe most likely mushroom is :\n{max_mush}")
        results.append(result)
    
    maxes_dict={i[0]:i[1] for i in maxes}
    print(f"\n\nHere are the maxes in dictionary form\n{maxes_dict}")
    
    ultimate_mush=get_max_mush(maxes_dict,other=False)
    print(f"The final chosen mushroom is:\n{ultimate_mush}")
    
    preidction = ultimate_mush[0]
    certainty  = ultimate_mush[1]
   

    size= 256,256
    cols = st.columns(3)
    if cols[1].button('Identify your Mushroom'):
        random_num = random.randint(0,len(spinner_quotes)-1)
        with st.spinner(spinner_quotes[random_num]):
            predict_cols = st.columns(3)

            with predict_cols[0]:
                st.header("Upload")

                im= Image.open(image)
                im.thumbnail(size)
                st.image(im)


            with predict_cols[1]:

                st.header("Prediction:")
                st.info(preidction)

                # To Do: This rounding and precision specification are not good.
                st.metric(label="Certainty",value=f'{100*round(certainty,2):.2f}%')


            with predict_cols[2]:
                st.header("Wiki Image")
                st.image(get_wiki_image(preidction))

            expander_cols = st.columns(3)

            try:
                if not Wiki_Api(preidction)["capShape"]:
                    pass

                else:

                    expander_info = expander_cols[0].expander("Cap Shape:")
                    im3= Image.open(pic_to_dict(Wiki_Api(preidction)["capShape"]))
                    im3.thumbnail(size)
                    expander_info.image(im3)

                    expander_hydro = expander_cols[1].expander("Hymenium Shape:")
                    im4= Image.open(pic_to_dict(Wiki_Api(preidction)["whichGills"]))
                    im4.thumbnail(size)
                    expander_hydro.image(im4)


                    expander_ed = expander_cols[2].expander("Edible:")
                    im5= Image.open(pic_to_dict(Wiki_Api(preidction)["howEdible"]))
                    im5.thumbnail(size)
                    expander_ed.image(im5)


                    expander_interesting = st.expander('interesing info')
                    expander_interesting.write('''A. muscaria was used by both shamans and laypeople alike, and was used recreationally as well as religiously. In eastern Siberia,
                                               the shaman would take the mushrooms, and others would drink his urine. This urine, still containing psychoactive elements,
                                               may be more potent than the A. muscaria mushrooms with fewer
                                               negative effects such as sweating and twitching, suggesting that the initial user may act as a screening
                                               filter for other components in the mushroom.''')
            except:
                pass





URL_size = 'http://127.0.0.1:8000/size'
URL_predict = 'http://127.0.0.1:8000/predict'

random_num = random.randint(0,len(spinner_quotes)-1)









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
