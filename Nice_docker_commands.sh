# The sudo here is just how I have to do this on my linux set up,
# it just makes sure you have permission to use it and will ask
# for a password each time you run a command preceeded by it.

# Start docker
sudo service docker start

#Show all docker images
docker images -a


# Stop all containers, delete all images, and prune the system.
docker stop CONTAINER_ID

# Delete all images
sudo docker rmi --force $(sudo docker images -q)
sudo docker system prune

# Check what images are on your computer
sudo docker images

# Build docker image from dockerfile
sudo docker build -t api .

# Run an image (called python:3.8.12-buster)  interactively.
sudo docker run -it python:3.8.12-buster sh

# Run docker interactively to see if everything is there.
sudo docker run -it -e PORT=8000 -p 8000:8000 api:latest sh

# Finally run in a way where you can call the docker hosted api from your local browser
sudo docker run  -e PORT=8000 -p 8000:8000 api:latest

# See what containers are running
sudo docker ps

# Stop or kill commands
docker stop 152e5b79177b  # ⚠️ use the correct CONTAINER ID
docker kill 152e5b79177b  # ☢️ only if the image refuses to stop (did someone create an ∞ loop?)

# Note
#Docker appears to be copying everything from this folder to the image. When it did this it copied
#the raw_data file, and some other things I didn't want and my computer was running out of memory
#before it could finish.

#To remedy this I just moved the raw data and the api files one directory up and then did the command.

#########################################
########## Setting up GCR ###############
#########################################
# First go throught he configuration steps described
# in the challenges.

# Set environment variables

# project ID
export PROJECT_ID='omega-clarity-337815'
gcloud config set project $PROJECT_ID

# name of docker image
export DOCKER_IMAGE_NAME=mushroom-docker
echo $DOCKER_IMAGE_NAME

# Now you can build it:
sudo docker build -t eu.gcr.io/$PROJECT_ID/$DOCKER_IMAGE_NAME .

# Check locally one last time before deployment
docker run -e PORT=8000 -p 8000:8000 eu.gcr.io/$PROJECT_ID/$DOCKER_IMAGE_NAME

# Push to google container registry
sudo docker push eu.gcr.io/$PROJECT_ID/$DOCKER_IMAGE_NAME

# Deploy on google cloud
gcloud run deploy --image eu.gcr.io/$PROJECT_ID/$DOCKER_IMAGE_NAME --platform managed --region europe-west1 --memory 4Gi



export PROJECT_ID='omega-clarity-337815'
export DOCKER_IMAGE_NAME=mushroom-docker

docker build ... --output /dev/shm
