import 'dart:convert';
import 'dart:io';
import 'package:camera/src/camera_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PredictionProvider with ChangeNotifier {
  File? imageFile;
  String? predictionMessage;
  String? predictedClass;
  String? confidence;
  final ImagePicker _picker = ImagePicker();

  set cameraController(CameraController? cameraController) {}
  
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> predictImage() async {
    if (imageFile == null) return;

    final url = Uri.parse(
        'https://rempah.loca.lt/api/predict-image');
    final request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath(
          'image', imageFile!.path)); 

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final data = await response.stream.transform(utf8.decoder).join();
        final result = jsonDecode(data);
        predictedClass = result['prediction'];
        confidence = result['confidence'];
      } else {
        predictedClass = "Prediksi tidak valid";
        confidence = "Tidak valid";
      }
      notifyListeners();
    } catch (e) {
      predictionMessage = 'Error: $e';
      notifyListeners();
    }
  }

  void clear() {
    imageFile = null;
    predictionMessage = null;
    notifyListeners();
  }
}
