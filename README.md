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

##csv data files:

###Dinahar_P_properties        
https://www.kaggle.com/dhinaharp/mushroom-dataset

###UCI_mushrooms.csv             : https://www.kaggle.com/uciml/mushroom-classification


##Picture datasets:

###David_Harper_species_pictures
https://www.kaggle.com/harperd17/mushroom-pictures

This has 6 species, each with a varied amount of photoes.

species                     # photos
amanita       bisporigera    606
amanita       muscaria       367
boletus       edulis         444
cantharellus                 1183
omphalotus    olearius       59
russula       mariae         235

-> useful for just these species. 

amanita muscaria, also known as fly agaric, is the most famous and easily identifiable mushroom.
amanita bisporigera, also known as the destroying angel, is tied with death cap (amanita phalloides) for most poisonous
mushroom.
boletus edulus is a "cèpe" or "steinpilz" or "penny bun", and a prized edible.
cantharellus is the chanterelle, a prized edible mushroom.
omphalotus, also known as jack-o-lantern, is poisonous, glows in the dark, and often mistaken for the choice edible cantharellus leading to poisonings.
russula mariae is an edible but unpleasant mushroom. Not of much interest.




