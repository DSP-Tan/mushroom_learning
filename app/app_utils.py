import streamlit as st
import requests
import os
import io
import base64
import json

from PIL import Image
from mushroom_learning.utils import Wiki_Api, get_wiki_image, pic_to_dict


# To do.
# Make the image encoding/decoding into a function and put here. Just take it
# out of the streamlit app.py file.



# To do
# change line: if key=='Other' to if not other and key=="Other"
# Incorporate the weights which will be the accuracies of hte model.
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


# store results in a list of dicts.
def query_species(payload,base_url):
    '''
    This takes in our image as a json encoded bytes payload, and then 
    queries the three species end points.
    '''
    results=[]
    maxes=[]
    for i in [1, 2, 3]:
        url=base_url+str(i)
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
    return ultimate_mush


