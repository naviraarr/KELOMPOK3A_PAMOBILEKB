import numpy as np
import pandas as pd
import pickle
import joblib
import tensorflow as tf
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, MinMaxScaler
from sklearn.compose import ColumnTransformer
from PIL import Image
from tensorflow.keras.preprocessing import image as keras_image

class_names = ["Jahe", "Kencur", "Kunyit", "Lengkuas"]

class Model:
    def __init__(self, model_path):
        if model_path.endswith('.pkl'):
            with open(model_path, 'rb') as f:
                self.model = pickle.load(f)
            self.model_type = 'sklearn'
        elif model_path.endswith('.joblib'):
            self.model = joblib.load(model_path)
            self.model_type = 'sklearn'
        elif model_path.endswith('.h5'):
            self.model = tf.keras.models.load_model(model_path)
            self.model_type = 'keras'
        elif model_path.endswith('.tflite'):
            self.model = tf.lite.Interpreter(model_path=model_path)
            self.model.allocate_tensors()
            self.model_type = 'tflite'
        else:
            raise ValueError(f"Model format '{model_path.split('.')[-1]}' not supported. Please use '.pkl', '.joblib', '.h5', or '.tflite'.")

    def data_pipeline(self, numerical_features=None, scaler_type="standard"):
        '''
        Method ini berfungsi untuk membuat pipeline yang mencakup preprocessing data dan model.  
        Jenis preprocessing yang diterapkan bergantung pada kebutuhan model yang digunakan.  
        Pada method ini, contoh preprocessing yang disertakan adalah StandardScaler dan MinMaxScaler.  
        Parameter `scaler_type` dipilih karena kedua scaler ini adalah yang paling umum digunakan.  
        Baik data tabular maupun data gambar dapat direpresentasikan dalam bentuk numerik, sehingga kedua tipe data tersebut  
        dapat diproses dalam method ini menggunakan StandardScaler dan MinMaxScaler.
        '''
        if self.model_type != 'sklearn':
            raise ValueError("Data pipeline is only supported for scikit-learn models.")
        
        transformers = []
        
        if numerical_features:
            if scaler_type == "standard":
                transformers.append(('scaler', StandardScaler(), numerical_features))
            elif scaler_type == "minmax":
                transformers.append(('scaler', MinMaxScaler(), numerical_features))
            else:
                raise ValueError(f"Unsupported scaler type: '{scaler_type}'. Use 'standard' or 'minmax'.")

        preprocessor = ColumnTransformer(transformers, remainder='passthrough')
        
        pipeline = Pipeline([
            ('preprocessor', preprocessor),
            ('model', self.model)
        ])
        
        return pipeline

    def predict_from_image(self, image_file):
        '''
        Terkhusus preprocessing basic seperti resize, rescale dan convert grayscale bisa dilakukan di sini.
        ika preprocessing yang dibutuhkan lebih kompleks, 
        sebaiknya dilakukan di method `data_pipeline` dan dipanggil di method ini.
        Tidak ada batasan dalam preprocessing, sesuaikan dengan kebutuhan model. 
        Yang terdapat pada contoh ini adalah preprocessing untuk model MNIST.
        '''
        image = Image.open(image_file).convert('RGB')
        img = image.resize((224, 224))
        img_array = keras_image.img_to_array(img) / 255.0  # Normalisasi ke rentang [0, 1]
        img_array = np.expand_dims(img_array, axis=0) 
        
        # Prediksi kelas menggunakan model Keras
        predictions = self.model.predict(img_array)
        predicted_class_index = np.argmax(predictions[0])

        # Confidence
        confidence = predictions[0][predicted_class_index]

        if confidence < 0.5:
            predicted_class_name = "Tidak termasuk dalam kategori yang dikenali"
        else:
            predicted_class_name = class_names[predicted_class_index]

        return predicted_class_name, confidence

    def predict_from_data(self, data, numerical_features=None):
        '''
        Method ini digunakan untuk memprediksi data tabular yang diberikan. Contoh yang digunakan dalam method ini adalah
        dataset iris dan model yang digunakan adalah random forest classifier yang telah di-training pada dataset iris.
        '''
        if self.model_type == 'sklearn':
            if isinstance(data, (list, np.ndarray)):
                data = pd.DataFrame([data])

            elif not isinstance(data, pd.DataFrame):
                raise ValueError("Data format not supported for sklearn model. Use list, NumPy array, or DataFrame.") 

            # Hasil prediksi berbentuk angka
            prediction = self.model.predict(data)

            # Parsing hasil prediksi menjadi label (case: iris dataset)
            prediction = "setosa" if prediction == 0 else "versicolor" if prediction == 1 else "virginica"

            return prediction

        elif self.model_type == 'keras':
            data = np.array(data)
            if data.ndim == 1:
                data = data.reshape(1, -1) 
            prediction = self.model.predict(data)
            return prediction.tolist()

        elif self.model_type == 'tflite':
            '''
            Model TensorFlow Lite pada contoh ini adalah model yang telah di-training pada dataset iris.
            Model ini menerima input berupa data numerik dan menghasilkan output berupa angka.
            '''
            input_details = self.model.get_input_details()
            output_details = self.model.get_output_details()
            
            data = np.array(data, dtype=input_details[0]['dtype'])
            if data.ndim == 1:
                data = np.expand_dims(data, axis=0)
            self.model.set_tensor(input_details[0]['index'], data)
            self.model.invoke()
            prediction = self.model.get_tensor(output_details[0]['index'])
            prediction = np.argmax(prediction, axis=1)
            return prediction.tolist()

        else:
            raise ValueError("Model type not supported.")
        
    @staticmethod
    def from_path(model_path):
        return Model(model_path)
