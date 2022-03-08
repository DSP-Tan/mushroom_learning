import requests

URL_base    = 'https://mushroom-docker-lpuaioudtq-ew.a.run.app/'
URL_size    = URL_base+'size/'
URL_predict = URL_base+'predict/'

print('Response from base URL:')
response = requests.get(URL_base)
print(response.json())




#print('Response from size URL:')
#response = requests.get(URL_base)
#print(response.json())

#print('Response from predict URL:')
#print(response.json())
