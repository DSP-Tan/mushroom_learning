import sys
from os.path import dirname, abspath, join
sys.path.append(join(dirname(abspath(__file__)), ".."))

from mushroom_learning.data import get_images_directory, load_validation_data, load_training_data, load_testing_data, get_labels_from_tfdataset, get_inputs_from_tfdataset, IMG_HEIGHT, IMG_WIDTH, BATCH_SIZE
from mushroom_learning.gcp import save_model_to_gcp
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras import optimizers
import tensorflow as tf
from tensorflow.keras.applications.vgg16 import VGG16
from tensorflow.keras import layers, models
from tensorflow.keras.callbacks import EarlyStopping
import matplotlib.pyplot as plt

LOCAL_PATH_TO_MODEL = "../model_species_vgg16_v1"

class Trainer(object):
    def __init__(self, train_ds, val_ds, test_ds, input_shape = (224, 224, 3)):
        self.X_train = get_inputs_from_tfdataset(train_ds)
        self.y_train = get_labels_from_tfdataset(train_ds)
        self.X_val = get_inputs_from_tfdataset(val_ds)
        self.y_val = get_labels_from_tfdataset(val_ds)
        self.X_test = get_inputs_from_tfdataset(test_ds)
        self.y_test = get_labels_from_tfdataset(test_ds)
        
        self.model = None
        self.history = None
        self.evaluate = None

        self.input_shape = input_shape
        self.num_classes = len(train_ds.class_names)

    def data_augmentation(self):
        datagen = ImageDataGenerator(
            featurewise_center = False,
            featurewise_std_normalization = False,
            rotation_range = 20,
            width_shift_range = 0.2,
            height_shift_range = 0.2,
            horizontal_flip = False,
            brightness_range = (0.5, 1.),
            zoom_range = (0.3, 1.5))
        
        datagen.fit(self.X_train)
        
        self.train_flow = datagen.flow(self.X_train, self.y_train, batch_size=32)
        self.val_flow = datagen.flow(self.X_val, self.y_val, batch_size=32)
    
    def load_model(self):
        self.model = VGG16(weights="imagenet", include_top=False, input_shape=self.input_shape, classes=self.num_classes, classifier_activation="softmax")
      
    def set_nontrainable_layers(self):
        self.model.trainable = False
        return self.model
    
    def add_last_layers(self):
        '''Take a pre-trained model, set its parameters as non-trainables, and add additional trainable layers on top'''
        initializer = tf.keras.initializers.GlorotUniform(seed=0)
        base_model = self.set_nontrainable_layers()
        dropout_layer = layers.Dropout(0.2)
        flatten_layer = layers.Flatten()
        dense_layer_1 = layers.Dense(50, activation='relu', kernel_initializer=initializer)
        dense_layer_2 = layers.Dense(20, activation='relu', kernel_initializer=initializer)
        prediction_layer = layers.Dense(self.num_classes, activation='softmax')
        rescaling = layers.Rescaling(1./255)

        self.model = models.Sequential([
            rescaling,
            base_model,
            dropout_layer, 
            flatten_layer,
            dense_layer_1,
            dense_layer_2,
            prediction_layer
        ])

    def build_model(self): 
        opt = optimizers.Adam(learning_rate=5e-4)
        
        self.model.compile(loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
                    optimizer=opt,
                    metrics=['accuracy'])

    def fit_model(self):
        es = EarlyStopping(monitor = 'val_accuracy', 
                   mode = 'max', 
                   patience = 5, 
                   verbose = 1, 
                   restore_best_weights = True)

        epochs = 100
        history = self.model.fit(self.train_flow,
                                      validation_data=self.val_flow, 
                                      epochs = epochs,
                                      verbose=1,
                                      callbacks=[es])
        
        self.history = history 
    
    def save_model(self):
        self.model.save(LOCAL_PATH_TO_MODEL)
        save_model_to_gcp()
    
    def run(self):
        self.data_augmentation()
        self.load_model()
        self.set_nontrainable_layers()
        self.add_last_layers()
        self.build_model()
    
        self.fit_model()
    
    def evaluate(self): 
        return self.model.evaluate(self.X_test, self.y_test)
    
    def plot_history(self):
        plt.plot(self.history.history['accuracy'])
        plt.plot(self.history.history['val_accuracy'])
        plt.show()

if __name__ == "__main__": 
    
    # storage_location = "models/model_species_simple_0.815"
    # local_path_to_model = "../model_species_simple_0.815"
    # save_model_to_gcp(local_path_to_model, storage_location)
    
    # storage_location1 = "models/model_poison_simple_0.68"
    # local_path_to_model1 = "../model_poison_simple_0.68"
    # save_model_to_gcp(local_path_to_model1, storage_location1)
    
    # get data 
    print("getting data")
    data_dir = get_images_directory("../raw_data/mushrooms_species_train_test/train")
    data_dir_test = get_images_directory("../raw_data/mushrooms_species_train_test/test")
    
    print("loading data")
    
    train_ds = load_training_data(data_dir)
    val_ds = load_validation_data(data_dir)
    test_ds = load_testing_data(data_dir_test)
    
    print("training")
    
    # Train and save model, locally and on gcp 
    trainer = Trainer(train_ds, val_ds, test_ds)
    trainer.run()
    
    print("saving model")
    trainer.save_model()
    print("saved")
    
    #load model from local storage 
    
    # EVALUATION 
    
    #accuracy = trainer.evaluate()
    #print("evaluating")
   # print(accuracy)
    #trainer.history.history['val_acc']
    
#    val_ds = load_validation_data()
#    print(type(val_ds))
#    trainer = Trainer(train=train_ds, val=val_ds)

#    save_to_gcp()
    # model = load_from_gcp()
   
    # img_height = 224
    # img_width = 224
    # class_names = ['edable', 'poison']

    # img = tf.keras.utils.load_img(
    #     "/Users/laurameyer/Desktop/011_DoZoYI2vj20.jpg", target_size=(img_height, img_width)
    # )

    # img_array = tf.keras.utils.img_to_array(img)
    # img_array = tf.expand_dims(img_array, 0) # Create a batch

    # prediction = model.predict(img_array)
    # print(prediction)
    # classif = int(prediction > .5)
    # print(classif)
    # print(f"This image most likely belongs to {class_names[classif]} with a score of: {prediction[0][0]:.2f}")

    

