import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rempah/controller.dart';
import 'package:rempah/ui/pages/homepage.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  CameraController? _cameraController;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _cameraController = CameraController(
          cameras[0],
          ResolutionPreset.high,
        );
        await _cameraController!.initialize();
        setState(() {});
      } else {
        debugPrint("Tidak Ada Kamera Tersedia");
      }
    } catch (e) {
      debugPrint("Kamera Error: $e");
    }
  }

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _isProcessing = true;
      });

      _showLoadingDialog(context);

      try {
        final predictionProvider =
            Provider.of<PredictionProvider>(context, listen: false);
        predictionProvider.imageFile = File(pickedFile.path);
        await predictionProvider.predictImage();
        Navigator.pop(context);
        _showPredictionDialog(
          context,
          predictionProvider.predictionMessage,
          predictionProvider.predictedClass,
          predictionProvider.confidence,
        );
      } catch (e) {
        Navigator.pop(context);
        debugPrint("Prediksi Gambar Error: $e");
      } finally {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        backgroundColor: Color(0xFFF7EAD1),
        title: Text(
          'Processing',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF7D1708),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'Mohon tunggu gambar anda sedang diproses....',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF7D1708),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPredictionDialog(
    BuildContext context,
    String? predictionMessage,
    String? predictedClass,
    String? confidence,
  ) {
    final pesan = (predictedClass != null && confidence != null)
        ? "Prediksi: $predictedClass\nAkurasi: $confidence"
        : (predictionMessage ?? "Prediksi tidak valid");
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          'Hasil Prediksi',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF7D1708),
          ),
        ),
        content: Text(
          pesan,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF7D1708),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7EAD1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF7D1708)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: _cameraController != null && _cameraController!.value.isInitialized
          ? Stack(
              children: [
                CameraPreview(_cameraController!),
                Positioned(
                  top: 20,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      if (!_isProcessing) {
                        _pickImage(context);
                      }
                    },
                    icon: const Icon(
                      Icons.add_photo_alternate,
                      color: Color(0xFF7D1708),
                      size: 30,
                    ),
                    tooltip: "Tambah Foto",
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (!_isProcessing) {
                          setState(() {
                            _isProcessing = true;
                          });

                          _showLoadingDialog(context);

                          try {
                            if (_cameraController != null &&
                                _cameraController!.value.isInitialized) {
                              final image =
                                  await _cameraController!.takePicture();
                              debugPrint('Gambar Diambil: ${image.path}');
                              final predictionProvider =
                                  Provider.of<PredictionProvider>(context,
                                      listen: false);
                              predictionProvider.imageFile = File(image.path);
                              await predictionProvider.predictImage();
                              Navigator.pop(context);
                              _showPredictionDialog(
                                context,
                                predictionProvider.predictionMessage,
                                predictionProvider.predictedClass,
                                predictionProvider.confidence,
                              );
                            }
                          } catch (e) {
                            Navigator.pop(context);
                            debugPrint("Pengambilan Gambar Error: $e");
                          } finally {
                            setState(() {
                              _isProcessing = false;
                            });
                          }
                        }
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7D1708),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.red.shade900,
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
