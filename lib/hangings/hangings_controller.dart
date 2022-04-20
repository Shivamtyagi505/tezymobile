import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quikieappps1/api/select_hangings/select_hangings_model.dart';
import 'package:quikieappps1/api/select_hangings/select_hangings_services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:quikieappps1/bill/generate_bill_controller.dart';
import 'package:quikieappps1/blouse/design/select_design/select_front_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectHangingsController extends GenerateBillController {
  HangingsModel? selectHangingsDesign;
  List<HangingsDesignItems>? items = [];

  File? _image;
  final picker = ImagePicker();
  DesignImage? hangingsDesignImage = DesignImage();

  Future<void> fetchSelectHangingsApi() async {
    selectHangingsDesign = await selectHangingsApi('hangings', 'hangings');
    items = selectHangingsDesign!.hangingsItems;
    notifyListeners();
  }

  Future imgFromCameraHangings() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (pickedFile != null) _image = File(pickedFile.path);
    hangingsDesignImage!.image = _image;
    hangingsDesignImage!.type = 'Camera';
    files.putIfAbsent('files..hangingsImage_blouse1', () => hangingsDesignImage!.image);
  }

  Future imgFromGalleryHangings() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (pickedFile != null) _image = File(pickedFile.path);
    hangingsDesignImage!.image = _image;
    hangingsDesignImage!.type = 'Gallery';

    files.putIfAbsent('files..hangingsImage_blouse1', () => hangingsDesignImage!.image);
  }

  saveHangingsImage(String key, DesignImage designImage) async {
    final prefs = await SharedPreferences.getInstance();
    if (designImage.type == 'Gallery' || designImage.type == 'Camera') {
      List<int> imageBytes = designImage.image.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      prefs.setString(key, base64Image);
    } else {
      prefs.setString(key, designImage.image);
    }
  }
}
