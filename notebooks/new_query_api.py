from requests.structures import CaseInsensitiveDict
import requests
import os
import numpy as np
import base64
import json

# Hosted URLs and endpoints.
URL_hosted        = 'https://mushroom-docker-lpuaioudtq-ew.a.run.app/'
URL_hosted_size   = URL_hosted + 'size'
URL_hosted_poison = URL_hosted + 'poison'
URL_hosted_species= URL_hosted + 'species'
URL_hosted_image  = URL_hosted + 'image'

# Local URLs and endpoints.
URL_base    = 'http://0.0.0.0:8000/'
URL_size    = URL_base+"size/"
URL_poison  = URL_base+"poison/"
URL_species = URL_base+"species/"
URL_image   = URL_base+"image/"

# Set up image.
with open('fart.jpg', 'rb') as f:
    im_API = f.read()
im_API=np.asarray(bytearray(im_API), dtype="uint8")
encoded = base64.b64encode(im_API)

print("--------------------------------------------------")
print("----------------Query local docker----------------")
print("--------------------------------------------------")

# Set up image Jerome's way.

print("--------------------------------------------------")
image_path='fart.jpg'
with open(image_path, "rb") as f:
    im_bytes = f.read()
im_b64 = base64.b64encode(im_bytes).decode("utf8")

headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}

payload = json.dumps({"image": im_b64})
print(type(payload))
#print(payload)
response = requests.post(URL_image, data=payload, headers=headers)

print(response.json())
print("---------------------------------------------------")

files={'mush':encoded}

print('\n\n')
# Get response from local base.
print('Response from base local  URL:')
response = requests.get(URL_base)
print(response)
print( response.json() )
print('\n\n')

# Get response from local size
print('Response from local size endpoint')
response = requests.post(URL_size,data=files)
print(response)
print(response.json())
print('\n\n')

# Get response from local poison
print('Response from local poison  endpoint')
response = requests.post(URL_poison,data=files)
print(response)
print(response.json())
print('\n\n')


# Get response from species
print('Response from local species endpoint')
response = requests.post(URL_species,data=files)
print(response)
print(response.json())
print('\n\n')

####################################################
####################################################

print("--------------------------------------------------")
print("----------------Query hosted docker---------------")
print("--------------------------------------------------")

image_path='amanita.jpg'
with open(image_path, "rb") as f:
    im_bytes = f.read()
im_b64 = base64.b64encode(im_bytes).decode("utf8")
payload = json.dumps({"image": im_b64})
headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}


print('\n\n')
# Get response from hosted base.
print('Response from hosted base  URL:')
response = requests.get(URL_hosted)
print(response)
print( response.json() )
print('\n\n')


# Get response from hosted size
print('Response from hosted size endpoint')


response = requests.post(URL_hosted_size, headers=headers,data=payload)
print(response)
print(response.json())
print('\n\n')

# Get response from hosted poison
print('Response from hosted poison  endpoint')
response = requests.post(URL_hosted_poison, headers=headers,data=payload)
#response = requests.post(URL_hosted_poison,data=files)
print(response)
print(response.json())
print('\n\n')


# Get response from hosted species
print('Response from hosted species endpoint')

# Necessary preprocessing
headers = CaseInsensitiveDict()
headers["accept"] = "application/json"
headers["Content-Type"] = "application/x-www-form-urlencoded"

image_path='fart.jpg'
with open(image_path, "rb") as f:
    im_bytes = f.read()
im_b64 = base64.b64encode(im_bytes).decode("utf8")

headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
payload = json.dumps({"image": im_b64})
print(type(payload))
url = "https://mushroom-docker-lpuaioudtq-ew.a.run.app/species"

response = requests.post(url,headers=headers,data=payload)
print(response)
print(response.json())
print('\n\n')






# Get response from hosted image



print("--------------------------------------------------")

print('Response from hosted image  URL:')


image_path='amanita.jpg'
with open(image_path, "rb") as f:
    im_bytes = f.read()
im_b64 = base64.b64encode(im_bytes).decode("utf8")


url = "https://mushroom-docker-lpuaioudtq-ew.a.run.app/image"
headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
payload = json.dumps({"image": im_b64})

print(URL_hosted_image)
print(url)

response = requests.post(URL_hosted_image, headers=headers,data=payload)
print(response)
print(response.json())
print("---------------------------------------------------")










print("--------------------------------------------------")
print('Response from hosted image  URL:')

image_path='fart.jpg'
with open(image_path, "rb") as f:
    im_bytes = f.read()
im_b64 = base64.b64encode(im_bytes).decode("utf8")
payload = json.dumps({"image": im_b64})

headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}

print(URL_hosted_image)
response = requests.post(url, headers=headers,data=payload)

print(response)
print(response.json())
print("---------------------------------------------------")

