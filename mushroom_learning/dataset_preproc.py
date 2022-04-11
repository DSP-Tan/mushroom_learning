import os
def find_species(path_to_imgs, species_name):
    '''
    This takes the path to the super directory, containing all the 
    species subfolders, and a species name as a string, which should have an _ 
    between the genus and species part of the name, and returns 
    the directory of this species.

    This is because the species directories are prepended with numbers and things
    like this, so this makes finding them easier.
    '''
    species_list=os.listdir(path_to_imgs)

    for i in species_list:
        if species_name.lower() in i.lower():
            return path_to_imgs+i
