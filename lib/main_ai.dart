import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  MyApp({required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LiveCameraScreen(cameras: cameras),
    );
  }
}

class LiveCameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  LiveCameraScreen({required this.cameras});

  @override
  State<LiveCameraScreen> createState() => _LiveCameraScreenState();
}

class _LiveCameraScreenState extends State<LiveCameraScreen> {
  late CameraController _controller;
  late Interpreter _interpreter;
  bool _isProcessing = false;
  List<String> _results = [];

  @override
  void initState() {
    super.initState();
    _initCamera();

  }

  Future<void> _initCamera() async {
    _controller = CameraController(widget.cameras[0], ResolutionPreset.medium, enableAudio: false);
    await _controller.initialize();
    await _loadModel();
    _controller.startImageStream(_processCameraImage);
    setState(() {});
  }

  Future<void> _loadModel() async {
    try {
      // _interpreter = await Interpreter.fromAsset('assets/models/Yolo-v8-Detection.tflite');
      _interpreter = await Interpreter.fromAsset('models/Yolo-v8-Detection.tflite');

      debugPrint("✅ Model loaded successfully");
    } catch (e) {
      debugPrint("❌ Failed to load model: $e");
    }
  }

  void _processCameraImage(CameraImage image) async {
    if (_isProcessing) return;
    _isProcessing = true;

    // تحويل YUV420 -> RGB
    final rgb = _convertYUV420ToRGB(image);

    // Resize و Normalize حسب ما يحتاج نموذجك (مثال: 640x640)
    final input = _imageToFloat32List(rgb, 640, 640);

    // نموذج YOLO: عادة يدخل input [1, 640, 640, 3]
    var output = List.filled(1 * 25200 * 85, 0.0).reshape([1, 25200, 85]); // عدل حسب نموذجك
    _interpreter.run(input, output);

    // تحليل النتائج (تحديد الكائنات)
    _results = _parseYOLOOutput(output);

    setState(() {});
    _isProcessing = false;
  }

  Uint8List _convertYUV420ToRGB(CameraImage image) {
    // هنا تحول الصورة يدويًا من YUV420 -> RGB
    // يمكنك استخدام كود جاهز للتحويل بدون أي مكتبات Helper
    return Uint8List(0); // placeholder
  }

  Float32List _imageToFloat32List(Uint8List rgb, int width, int height) {
    final list = Float32List(width * height * 3);
    // ضع الكود لتحويل Uint8List إلى Float32List مع normalize
    return list;
  }

  List<String> _parseYOLOOutput(dynamic output) {
    // هنا حلل النتائج وارجع أسماء الكائنات المكتشفة
    return ['car', 'person']; // مثال
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) return Container();
    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_controller),
          Positioned(
            top: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _results.map((e) => Text(e, style: TextStyle(color: Colors.red, fontSize: 18))).toList(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _interpreter.close();
    super.dispose();
  }
}
