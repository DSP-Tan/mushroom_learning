# Data analysis

- Document here the project: mushroom_learning
- Description: Project Description
- Data Source:
- Type of analysis:

Please document the project the better you can.

# Startup the project

The initial setup.

Create virtualenv and install the project:
```bash
sudo apt-get install virtualenv python-pip python-dev
deactivate; virtualenv ~/venv ; source ~/venv/bin/activate ;\
    pip install pip -U; pip install -r requirements.txt
```

Unittest test:
```bash
make clean install test
```

Check for mushroom_learning in gitlab.com/{group}.
If your project is not set please add it:

- Create a new project on `gitlab.com/{group}/mushroom_learning`
- Then populate it:

```bash
##   e.g. if group is "{group}" and project_name is "mushroom_learning"
git remote add origin git@github.com:{group}/mushroom_learning.git
git push -u origin master
git push -u origin --tags
```

Functionnal test with a script:

```bash
cd
mkdir tmp
cd tmp
mushroom_learning-run
```

# Install

Go to `https://github.com/{group}/mushroom_learning` to see the project, manage issues,
setup you ssh public key, ...

Create a python3 virtualenv and activate it:

```bash
sudo apt-get install virtualenv python-pip python-dev
deactivate; virtualenv -ppython3 ~/venv ; source ~/venv/bin/activate
```

Clone the project and install it:

```bash
git clone git@github.com:{group}/mushroom_learning.git
cd mushroom_learning
pip install -r requirements.txt
make clean install test                # install and test
```
Functionnal test with a script:

```bash
cd
mkdir tmp
cd tmp
mushroom_learning-run
```

# Data set descriptions

## csv data files:

### Dinahar_P_properties        
https://www.kaggle.com/dhinaharp/mushroom-dataset

### UCI_mushrooms.csv             
https://www.kaggle.com/uciml/mushroom-classification


## Picture datasets:

### David_Harper_species_pictures
https://www.kaggle.com/harperd17/mushroom-pictures

same data converted to jpeg:
https://www.kaggle.com/jarxrr/mushroom-pictures


This has 6 species, each with a varied amount of photoes. 59 MB in total.

species                     # photos<br/>
amanita bisporigera    606 <br/> 
amanita muscaria       367 <br/> 
boletus edulis         444 <br/> 
cantharellus           1183<br/> 
omphalotus olearius    59  <br/> 
russula mariae         235 <br/> 

-> useful for just these species. 

amanita muscaria, also known as fly agaric, is the most famous and easily identifiable mushroom.

amanita bisporigera, also known as the destroying angel, is tied with death cap (amanita phalloides) for most poisonous
mushroom.

boletus edulus is a "cèpe" or "steinpilz" or "penny bun", and a prized edible.
cantharellus is the chanterelle, a prized edible mushroom.

omphalotus, also known as jack-o-lantern, is poisonous, glows in the dark, and often mistaken for the choice edible cantharellus leading to poisonings.

russula mariae is an edible but unpleasant mushroom. Not of much interest.

### Stepan Dupilak - predict poison mushrooom by photo
https://www.kaggle.com/stepandupliak/predict-poison-mushroom-by-photo

A large (2GB) collection of photos of mushrooms in two folders classified as either poisonous or edible.
There are no other labels on the photos so we would have to take this guys word for it.

6937 edible mushroom photos.
4766 poisonous mushroom photos.

###

### MUST_AI - Mushroom Classification Dataset
https://www.kaggle.com/mustai/mushroom-12-9528

This is a gigantic data set of (2GB), with 9528 mushroom images, these are broken into
train test and valid directories. These directories are then broken into specific family
directories.

We want species names, not family names. We can maybe further categorise within these folders
to get to the species names. 

The images are however clearly ordered by species type within these folders, so it would not be 
difficult to reapply the species labels.

The images were scraped from http://www.mushroom.world.

This could be a good starting model to narrow a mushroom down to it's family type, and then use
further models to narrow it down to species.

family       # phots<br/>
Agaricus     681<br/>
Amanita      523<br/>
Boletus      751<br/>
Cortinarius  585<br/>
Entoloma     587<br/>
Exidia       304<br/>
Hygrocybe    520<br/>
Inocybe      432<br/>
Lactarius    760<br/>
Pluteus      308<br/>
Russula      751<br/>
Suillius     462<br/>


In the code section of this dataset there are examples a model trained to identify
the different families. Ther people who made this don't seem to know the difference
between a species and a genus.

### Saurabh Shahane - Mushroom Object Detection Dataset
https://www.kaggle.com/saurabhshahane/mushroom-object-detection-dataset


Tiny (8.42) data set with pictures of just chanterelles and chicken of the woods. The images are
labelled as chicken of the woods or chanterelle. There are 247 in the training folder, 6 in the test
folder, and 6 in the validation folder. It seems there were a small
number of original images here which have been proliferated already. Or multiplied or whatever
the word is.

## From searching kaggle for "mushrooms"

### Ilya Kondrusevich - Mushrooms
https://www.kaggle.com/ilyakondrusevich/mushrooms


Medium sized data set of 377.43 MB. Species are identified in each picture usefully, but the language is not english.
Maybe russian or something. Either way the particular species could be identified from the pictures and used.

There are 553 files for ...

This can be analysed later to see the mushrooms per species etc.
It has folders broken into "Detection" and "Classification", so this could be
interesting.

### CatDogo - Mushrooms classification - Common genus's images
https://www.kaggle.com/maysee/mushrooms-classification-common-genuss-images

This is suspiciously similar to the MUST_AI dataset. Here there is less description,
but they are aware that it is genus that they identify, and also they specify here that
these are nothern european mushrooms. It is likely that CatoDogo also scraped mushroom.world,
but with some different criteria. You could check to see if there are the same images in 
each of the datasets.

There is 994.25, and you can notice that the number of photos of each genus are a bit different.
Exidia, Incocybe, and Pluteus genuses not present. Perhaps this is not 
in northerm europe.


family       # ph<br/>
Agaricus     353<br/>
Amanita      750<br/>
Boletus      1073<br/>
Cortinarius  836<br/>
Entoloma     364<br/>
Hygrocybe    316<br/>
Lactarius    1563<br/>
Russula      1148<br/>
Suillius     311<br/>


## Good options for datasets with species names:

### Use kaggle api to get data which was for this challenge
https://www.kaggle.com/c/fungi-challenge-fgvc-2018/data

It's here:
https://github.com/visipedia/fgvcx_fungi_comp#data

It is 13 GB of training and validation. But I think all labelled with species.
So this is the data we need. Maybe some species are underrepresented, and it's ok
if we can't identify them all.

See description here:
https://towardsdatascience.com/computer-vision-lets-classify-mushrooms-6b3abe1561eb

### Use the webscraping described by the finnish people.

See their GitHub for that.

### give up commercial rights and use image net.

http://fungai.org/2017/12/12/download-imagenet-images-by-wnid/
http://fungai.org/2017/12/13/train-a-basic-wild-mushroom-classifier/

No!
