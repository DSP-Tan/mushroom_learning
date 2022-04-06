# Mushroom Learning

The mushroom learning app is hosted on heroku at https://mushroom-magicz.herokuapp.com/

Mushroom learning is a repository containing a project aimed at the 
specification of mushrooms. It contains two types of convolutional neural 
network models: the first is one trained on a data set of various mushrooms
labelled as either poisonous or edible, and will estimate the poisonousness or
edibility of a mushroom based on it's appearance; the second type of model, of
which there are currently 4, detects the species of a mushroom by it's appearance.
In it's current incarnation, the application can identify 36 mushroom species.

Up to this point, the data have mainly been obtained from the kaggle competition data
set, described below, merged with the other species datasets also described below.

The trained models are in the api with base url:
https://mushroom-docker-lpuaioudtq-ew.a.run.app/

To see how to query this, see the file "new_remote_query.py" located
in the api folder of this repository. There are 4 end points: poison, which
predicts the poisonousness or edibility; species1, which will tell you if the
image you posted is one of a given 12 mushrooms, or other; species2 which will
tell you if your mushroom is one of a different 12 mushrooms, or other; and species3,
which will tell you if the mushroom is one of another gorup of 12.



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
These data sets were largely obtained by searching kaggle for the different keywords "mushroom", "mushrooms", "fungus" and "fungi".
Some were found through google searches or blog posts, and where this is the case it is specified.

## csv data files:

### Dinahar_P_properties        
https://www.kaggle.com/dhinaharp/mushroom-dataset

### UCI_mushrooms.csv             
https://www.kaggle.com/uciml/mushroom-classification


## Species Labelled Picture datasets:
These are datasets where the pictures are labelled by species, which is
necessary for any mushroom species detection application.

### David Harper species pictures
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

cantharellus is the chanterelle, a prized edible mushroom. Cantharellus is a genus name; what David Harper has here is
the species cantharellus cibarius.

omphalotus, also known as jack-o-lantern, is poisonous, glows in the dark, and often mistaken for the choice edible cantharellus leading to poisonings.

russula mariae is an edible but unpleasant mushroom. Not of much interest.

### Kaggle competition dataset.
https://www.kaggle.com/c/fungi-challenge-fgvc-2018/data

It's here:
https://github.com/visipedia/fgvcx_fungi_comp#data

This is a large 13 GB data set of mushroom pictures, with 1394 different labellled
mushroom speices.

See description here:
https://towardsdatascience.com/computer-vision-lets-classify-mushrooms-6b3abe1561eb

Here is a sample of the species sorted in order of most photographs:
| Species                   | #phot         |
| ------------------------- | ------------- |
| Plicatura crispa          |	 442        |
| Pluteus cervinus	        |    419        |
| Tricholoma scalpturatum   |    414        |
| Xerocomellus chrysenteron |    406        |
| Mycena galericulata	    |    375        |
| Byssomerulius corium	    |    374        |
| Cylindrobasidium laeve    |    364        |
| Armillaria lutea	        |    352        |
| Ganoderma pfeifferi	    |    342        |
| Coprinellus micaceus	    |    340        |
| Fomitopsis pinicola	    |    329        |
| Trametes versicolor	    |    313        |
| Fomes fomentarius	        |    308        |
| Psathyrella candolleana   |    298        |
| Xylodon paradoxus	        |    291        |
| ...                       |    ...        |
| Hydnum_albidum            |      6        |
| Clitocybe_alexandri       |      6        |
| Russula_carpini           |      6        |
| Claviceps_purpurea        |      6        |
| Physalacria_cryptomeriae  |      6        |
| Ramaria_formosa           |      6        |



Here is the output of the pandas.describe() method applied to the number of photos:
| count | mean | std | min | 25% | 50% | 75% | max |
| ----- | ---- | --- | --- | --- | --- | --- | --- |
| 1394  | 64   | 60  | 6   | 22  | 46  | 88  | 442 |


This data set has 275 species with 100 pictures, but the majority of the species in this data set
have less than this amount, with the median number of pictures being 46. However, not all of these
species are of interest anyway, so this is still a very useful dataset.

Note: using these pictures means you forfeit commercial rights.

### Saurabh Shahane - Mushroom Object Detection Dataset
https://www.kaggle.com/saurabhshahane/mushroom-object-detection-dataset


Tiny (8.42 MB) data set with pictures of just chanterelles and chicken of the woods. The images are
labelled as chicken of the woods or chanterelle. There are 247 in the training folder, 6 in the test
folder, and 6 in the validation folder. It seems there were a small
number of original images here which have been proliferated already. Or multiplied or whatever
the word is.


### Ilya Kondrusevich - Mushrooms
https://www.kaggle.com/ilyakondrusevich/mushrooms


Medium sized data set of 377.43 MB. Species are identified in each picture usefully, but the language is not english.
Maybe russian or something. Either way the particular species could be identified from the pictures and used.

There are 553 files for ...

This can be analysed later to see the mushrooms per species etc.
It has folders broken into "Detection" and "Classification", so this could be
interesting.

## Mushrooms with genus labels
Knowing the genus can still be useful, but a more likely use for these data sets is to just
use them to extract the specifi species from them. You can see that within the specific genus
folders the mushrooms are still ordered by species. So perhaps species names can be restored 
to them.

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

In the code section of this dataset there are examples a model trained to identify
the different families. Ther people who made this don't seem to know the difference
between a species and a genus.

See below CatDogo dataset description for a count of the number of photos per genus
in this dataset. 

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

| Genus         | #phot CatDogo | #phot MUST_AI |
| ------------- | ------------- | ------------- |
| Agaricus      |  353          | 681           | 
| Amanita       |  750          | 523           |
| Boletus       |  1073         | 751           |
| Cortinarius   |  836          | 585           |
| Entoloma      |  364          | 587           |
| Exidia        |  0            | 304           |
| Hygrocybe     |  316          | 520           |
| Incocybe      |  0            | 432           |
| Lactarius     |  1563         | 760           |
| Pluteus       |  0            | 308           |
| Russula       |  1148         | 751           |
| Suillius      |  311          | 462           |

## Pictures labelled by poison/edible
It seems alot of people go down the path of just trying to detect whether a mushroom is
poisonous or edible by it's appearance. To me this seems to be an intrinsicly ill-defined problem,
because poisonous mushrooms do not look at certain way, and neither do edible ones. There are poisonous
mushrooms which look more similar to all edible mushrooms than to other poisonous ones, and vice versa.

In this project we have however trained a poisonous detection model; testing it on the kaggle competition
death caps, we see that it incorrectly classifies 56% of them as edible.

### Stepan Dupilak - predict poison mushrooom by photo
https://www.kaggle.com/stepandupliak/predict-poison-mushroom-by-photo

A large (2GB) collection of photos of mushrooms in two folders classified as either poisonous or edible.
There are no other labels on the photos so we would have to take this guys word for it.

6937 edible mushroom photos.
4766 poisonous mushroom photos.


## Options to obtain more data

### Use the webscraping described by the finnish people.

https://tuomonieminen.github.io/deep-shrooms/

### Use image net.

http://fungai.org/2017/12/12/download-imagenet-images-by-wnid/
http://fungai.org/2017/12/13/train-a-basic-wild-mushroom-classifier/

It seems, however, that ImageNet has changed considerably since the time that these articles
were written, and it is now less straightforward to get pictures from there. Though we have 
certainly not exhausted all means by which this may be possible.

Note: if you use imagenet images you cannot do commercial things with the pictures.
