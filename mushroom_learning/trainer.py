from mushroom_learning.data import load_training_data, load_validation_data
from mushroom_learning.gcp import save_to_gcp, load_from_gcp
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.models import Sequential
from tensorflow.keras import layers
from tensorflow.keras.callbacks import EarlyStopping

class Trainer(object):
    def __init__(self, train, val):
        self.train = train
        self.val = val
        self.model = None
        self.history = None


    def augmentation(self):
        img_height = 224
        img_width = 224

        return keras.Sequential(
            [
                layers.RandomFlip("horizontal",
                      input_shape=(img_height,
                                  img_width,
                                  3)),
                layers.RandomRotation(0.1),
                layers.RandomZoom(0.1),
            ]
        )

    def initiate_model(self):
        img_height = 224
        img_width = 224
        augmentation = augmentation()

        model = Sequential([
            augmentation,
            layers.Rescaling(1./255, input_shape=(img_height, img_width, 3)),
            layers.Conv2D(16, 3, padding='same', activation='relu'),
            layers.MaxPooling2D(),
            layers.Conv2D(32, 3, padding='same', activation='relu'),
            layers.MaxPooling2D(),
            layers.Conv2D(64, 3, padding='same', activation='relu'),
            layers.MaxPooling2D(),
            layers.Dropout(0.2),
            layers.Flatten(),
            layers.Dense(128, activation='relu'),
            layers.Dense(1, activation='sigmoid')
        ])

        opt = keras.optimizers.Adam(learning_rate=1e-4)

        model.compile(optimizer=opt,
            loss=tf.keras.losses.BinaryCrossentropy(from_logits=True),
            metrics=['accuracy']
        )

        self.model= model

    def fit_model(self):
        es = EarlyStopping(patience=2, restore_best_weights=True)

        epochs = 10
        history = self.model.fit(
            self.train,
            validation_data=self.val,
            epochs=epochs,
            callbacks=[es],
            verbose=1
        )

        self.history = history

    def evaluate_model(self):
        # precision
        acc = self.history.history['accuracy']
        val_acc = self.history.history['val_accuracy']
        loss = self.history.history['loss']
        val_loss = self.history.history['val_loss']
        return f"accuracy: {acc}, val_accuracy: {val_acc}, loss: {loss}, val_loss: {val_loss}"

    # change path if you train a new model
    def save_model(self):
        self.model.save("../our_first_model")

if __name__ == "__main__":
    #train_ds = load_training_data()
   # print(type(train_ds))
#    val_ds = load_validation_data()
#    print(type(val_ds))
#    trainer = Trainer(train=train_ds, val=val_ds)

#    save_to_gcp()
    model = load_from_gcp()

    img_height = 224
    img_width = 224
    class_names = ['edable', 'poison']

    img = tf.keras.utils.load_img(
        "/Users/laurameyer/Desktop/poisonous-white-mushrooms.jpg", target_size=(img_height, img_width)
    )

    img_array = tf.keras.utils.img_to_array(img)
    img_array = tf.expand_dims(img_array, 0) # Create a batch

    prediction = model.predict(img_array)
    print(prediction)
    classif = int(prediction > .5)
    print(classif)


    print(f"This image most likely belongs to {class_names[classif]} with a score of: {prediction[0][0]:.2f}")
