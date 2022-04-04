import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:quikieappps1/bill/generate_bill_controller.dart';

class PreviewOrderBlouseController extends GenerateBillController {
  dynamic status = [true, true, true, true];

  File? image;
  final picker = ImagePicker();
  bool isFabric = false;

  Future imgFromCameraFabric() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      files.putIfAbsent('files.fabricImage_blouse1', () => image!);
      isFabric = false;
    }
    notifyListeners();
  }
}
