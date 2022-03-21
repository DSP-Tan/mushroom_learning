FROM python:3.8.12-buster

COPY api /api
COPY mushroom_learning /mushroom_learning
COPY min_docker_requirements.txt /requirements.txt

COPY models_from_gcp/model_poison_vgg19_72 /model_poison_vgg19_72
COPY models_from_gcp/model_1_species_vgg16 /model_1_species_vgg16
COPY models_from_gcp/model_2_species_vgg16 /model_2_species_vgg16
COPY models_from_gcp/model_3_species_vgg16 /model_3_species_vgg16

RUN pip install -r requirements.txt

# These commands are necessary for open-cv, which
# relies on normal linux libraries which would be
# on a normal computer but are not on the docker
# system.
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y


CMD uvicorn api.new_new_fast:app --host 0.0.0.0 --port $PORT
