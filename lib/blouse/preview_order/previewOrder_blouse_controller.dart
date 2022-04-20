import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:quikieappps1/bill/generate_bill_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreviewOrderBlouseController extends GenerateBillController {
  dynamic status = [true, true, true, true];
  File? image;
  final picker = ImagePicker();
  bool isFabric = false;
  bool zipTypeIndex = false;
  bool hooksIndex = false;
  int? zipTypeLabel = 1;
  int? hooksLabel = 1;

  Future imgFromCameraFabric() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      files.putIfAbsent('files.fabricImage_blouse1', () => image!);
      isFabric = false;
    }
    notifyListeners();
  }

  saveSleevesImage(String key, File image) async {
    final prefs = await SharedPreferences.getInstance();
    List<int> imageBytes = image.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    prefs.setString(key, base64Image);
  }

  savePreviewOrder(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  savePreviewOrderString(String key, int index) async {
    final prefs = await SharedPreferences.getInstance();
    if (index == 0) {
      prefs.setString(key, 'Backs');
    } else if (index == 1) {
      prefs.setString(key, 'Front');
    } else if (index == 2) {
      prefs.setString(key, 'Side');
    }
  }
}
