import wikipedia
import requests
import json
from PIL import Image
from mushroom_learning.utils import Wiki_Api, get_wiki_image, pic_to_dict

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

preidction = 'Amanita muscaria'

size= 256,256
if image:
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
                st.metric(label="Certainty",value='66%')


            with predict_cols[2]:
                st.header("Wiki Image")
                st.image(get_wiki_image(preidction))

            expander_cols = st.columns(3)
            st.write(Wiki_Api(preidction)["capShape"])
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
