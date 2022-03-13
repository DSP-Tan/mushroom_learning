from requests.structures import CaseInsensitiveDict
import requests
import os
import numpy as np
import base64
import json


# Local URLs and endpoints.
URL_base    = "https://mushroom-docker-lpuaioudtq-ew.a.run.app/"
URL_size    = URL_base+"size/"
URL_poison  = URL_base+"poison"
URL_species = URL_base+"species"
URL_species1 = URL_base+"species1"
URL_species2 = URL_base+"species2"
URL_species3 = URL_base+"species3"
URL_image   = URL_base+"image"

print("--------------------------------------------------")
print("----------------Query local docker----------------")
print("--------------------------------------------------")

image_path='../raw_data/fart.jpg'


print('\n\n')
# Get response from local base.
print('Response from base local  URL:')
response = requests.get(URL_base)
print(response)
print( response.json() )
print('\n\n')

# Get response from local size
print('Response from local size endpoint')
# Set up image old way.
with open(image_path, 'rb') as f:
    im_API = f.read()
im_API=np.asarray(bytearray(im_API), dtype="uint8")
encoded = base64.b64encode(im_API)
files={'mush':encoded}

response = requests.post(URL_size,data=files)
print(response)
print(response.json())
print('\n\n')

# Set up image Jerome's way.
with open(image_path, "rb") as f:
    im_bytes = f.read()
im_b64 = base64.b64encode(im_bytes).decode("utf8")
headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
payload = json.dumps({"image": im_b64})

# Get response from local image
response = requests.post(URL_image, data=payload, headers=headers)
print("--------------------------------------------------")
print(response)
print(response.json())
print("---------------------------------------------------")



# Get response from local poison
print('\n\nResponse from local poison  endpoint')
response = requests.post(URL_poison, headers=headers,data=payload)
print(response)
print(response.json())
print('\n\n')


# Get response from species
print('Response from local species endpoint')
response = requests.post(URL_species, headers=headers,data=payload)
print(response)
print(response.json())
print('\n\n')

# Get response from species1
print('Response from local species1 endpoint')
response = requests.post(URL_species1, headers=headers,data=payload)
print(response)
print(response.json())
print('\n\n')

# Get response from species2
print('Response from local species2 endpoint')
response = requests.post(URL_species2, headers=headers,data=payload)
print(response)
print(response.json())
print('\n\n')

# Get response from species3
print('Response from local species3 endpoint')
response = requests.post(URL_species3, headers=headers,data=payload)
print(response)
print(response.json())
print('\n\n')




####################################################
####################################################


