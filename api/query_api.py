import requests
URL_base    ='https://mushroom-docker-lpuaioudtq-ew.a.run.app'
URL_base    ='http://0.0.0.0:8000/'


URL_size    = URL_base+'size/'
URL_predict = URL_base+'predict/'


mush_path='./FS2013PIC82005485.JPG'

print('Response from base URL:')
response = requests.get(URL_base)
print(response.json())


files = {'mush': mush_path  }

print('Response from size URL:')
response = requests.get(URL_base,data=files)
print(response.json())

#print('Response from predict URL:')
#print(response.json())
