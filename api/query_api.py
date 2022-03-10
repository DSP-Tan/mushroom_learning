import requests
import os

URL_base    ='https://mushroom-docker-lpuaioudtq-ew.a.run.app'
URL_base    ='http://0.0.0.0:8000/'


URL_size    = URL_base+'size/'
URL_predict = URL_base+'predict/'


mush_path='FS2013PIC82005485.JPG'
mush_path='APE2017-9186528_HyZ-iZy6vg.JPG'

print('Response from base URL:')
response = requests.get(URL_base)
print(response.json())

image_path=os.path.join(os.getcwd(),mush_path)
#with open(image_path,"wb") as f:
#    f.write(image.getbuffer())

files = {'mush': mush_path  }

print('Response from size URL:')
response = requests.get(URL_size,data=files)
print(response.json())

print('Response from predict URL:')
response=requests.get(URL_predict,data=files)
print(response)
