import wikipedia
import requests
import json
from PIL import Image

WIKI_REQUEST = 'http://en.wikipedia.org/w/api.php?action=query&prop=pageimages&format=json&piprop=original&titles='

url='https://en.wikipedia.org/w/api.php'

def get_wiki_image(search_term):
    try:
        result = wikipedia.search(search_term, results = 1)
        wikipedia.set_lang('en')
        wkpage = wikipedia.WikipediaPage(title = result[0])
        title = wkpage.title
        response  = requests.get(WIKI_REQUEST+title)
        json_data = json.loads(response.text)
        img_link = list(json_data['query']['pages'].values())[0]['original']['source']
        return img_link
    except:
        return 0

def Wiki_Api(mushroom_name):
  mushroom_dict = {}

  params={
    'action':'query',
    'format':'json',
    'titles':mushroom_name,
    'prop':'revisions',
    'rvsection':0,
    'rvprop':'content'}
    #Inital response from Wiki web page
  response=requests.get(url,params).json()

    #Find key for Json
  key = list(response['query']['pages'].keys())[0]
  lines = response['query']['pages'][key]['revisions'][0]['*'].split('\n')
  cap_counter  =0
  for line in lines:
    if 'howEdible' in line:
        mushroom_dict["howEdible"] = line.split('=')[1].strip(" ").strip("}")
    # if 'howEdible2' in line:
    #   mushroom_dict["howEdible2"] = line.split('=')[1].strip(" ")
    if 'whichGills' in line:
      mushroom_dict["whichGills"] = line.split('=')[1].strip(" ")
    if 'capShape' in line and cap_counter==0:
      mushroom_dict["capShape"] = line.split('=')[1].strip(" ")
      cap_counter += 1
    # if 'hymeniumType' in line:
    #   mushroom_dict["hymeniumType"] = line.split('=')[1].strip(" ")
    # if 'stipeCharacter' in line:
    #   mushroom_dict["stipeCharacter"] = line.split('=')[1].strip(" ")
    # if 'ecologicalType' in line:
    #   mushroom_dict["ecologicalType"] = line.split('=')[1].strip(" ")
    # if 'sporePrintColor'  in line:
    #   mushroom_dict["sporePrintColor"] = line.split('=')[1].strip(" ")

  return (mushroom_dict)


def pic_to_dict(dic_item):
  folder_loc = "Wiki_images" #where we will retrieve the files from
  root_folder = "/Users/burty/code/DSP-Tan/mushroom_learning/app/"
  full_loc = f"{root_folder}/{folder_loc}/{dic_item}.jpeg"
  im = Image.open(full_loc)
  size = 126,126
  im.thumbnail(size)
  return full_loc

def convert_name(name):
    return name.replace('_'," ").capitalize()
