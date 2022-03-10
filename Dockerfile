FROM python:3.8.12-buster

COPY api /api
COPY mushroom_learning /mushroom_learning
COPY our_first_model /our_first_model
COPY min_docker_requirements.txt /requirements.txt
COPY model_poison_vgg19_72 /model_poison_vgg19_72

#RUN pip3 install pathlib==1.0.1
RUN pip install -r requirements.txt

# These commands are necessary for open-cv, which
# relies on normal linux libraries which would be
# on a normal computer but are not on the docker
# system.
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y


CMD uvicorn api.fast:app --host 0.0.0.0 --port $PORT
