import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quikieappps1/api/select_design/select_design_model.dart';
import 'package:quikieappps1/api/select_design/select_design_services.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/bill/generate_bill_controller.dart';
import 'package:quikieappps1/blouse/design/select_design/select_front_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlouseSelectDesignController extends GenerateBillController {
  ReferenceImageType? selectFrontDesign;
  ReferenceImageType? selectBackDesign;
  ReferenceImageType? selectSleeveDesign;
  List<SelectDesignClass>? selectFrontDesignClass = [];
  List<SelectDesignClass>? selectBackDesignClass = [];
  List<SelectDesignClass>? selectSleeveDesignClass = [];
  File? _frontimage;
  final picker = ImagePicker();
  DesignImage? frontDesignImage = DesignImage();
  File? _backimage;
  var backImage;
  DesignImage? backDesignImage = DesignImage();
  File? _sleevesimage;
  DesignImage? sleeveDesignImage = DesignImage();
  var frontImageUrl;
  var backImageUrl;
  var sleevesImageUrl;

  Future imgFromCameraSleeves() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) _sleevesimage = File(pickedFile.path);
    sleeveDesignImage!.image = _sleevesimage;
    sleeveDesignImage!.type = 'Camera';
    files.putIfAbsent('files.sleevesImage_blouse1', () => sleeveDesignImage!.image);
    notifyListeners();
  }

  Future imgFromGallerySleeves() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) _sleevesimage = File(pickedFile.path);
    sleeveDesignImage!.image = _sleevesimage;
    sleeveDesignImage!.type = 'Gallery';
    files.putIfAbsent('files.sleevesImage_blouse1', () => sleeveDesignImage!.image);
    notifyListeners();
  }

  Future imgFromCameraBack() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) _backimage = File(pickedFile.path);
    backDesignImage!.image = _backimage;
    backDesignImage!.type = 'Camera';
    files.putIfAbsent('files.backImage_blouse1', () => backDesignImage!.image);
    notifyListeners();
  }

  Future imgFromGalleryBack() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) _backimage = File(pickedFile.path);
    backDesignImage!.image = _backimage;
    backDesignImage!.type = 'Gallery';
    files.putIfAbsent('files.backImage_blouse1', () => backDesignImage!.image);
    notifyListeners();
  }

  Future imgFromCameraFront() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) _frontimage = File(pickedFile.path);
    frontDesignImage!.image = _frontimage;
    frontDesignImage!.type = 'Camera';
    files.putIfAbsent('files.frontImage_blouse1', () => frontDesignImage!.image);
    notifyListeners();
  }

  Future imgFromGalleryFront() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) _frontimage = File(pickedFile.path);
    frontDesignImage!.image = _frontimage;
    frontDesignImage!.type = 'Gallery';
    files.putIfAbsent('files.frontImage_blouse1', () => frontDesignImage!.image);
    notifyListeners();
  }

  Future<void> fetchSelectFrontDesignApi() async {
    selectFrontDesign = await selectDesignApi('blouse', 'front');
    selectFrontDesignClass = selectFrontDesign!.data;
    notifyListeners();
  }

  Future<void> fetchSelectBackDesignApi() async {
    selectBackDesign = await selectDesignApi('blouse', 'back');
    selectBackDesignClass = selectBackDesign!.data;
    notifyListeners();
  }

  Future<void> fetchSelectSleeveDesignApi() async {
    selectSleeveDesign = await selectDesignApi('sleeve', 'sleeves');
    selectSleeveDesignClass = selectSleeveDesign!.data;
    notifyListeners();
  }

  void splitHastTag() {
    List hashTags = [];
    for (var i = 0; i < selectBackDesignClass!.length; i++) {
      hashTags.add(selectBackDesignClass![i].attributes!.hashTag);
    }
    print(hashTags);
  }

  Widget imageContainer(String text) {
    return Container(
      child: Expanded(
        child: Stack(alignment: Alignment.topRight, children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              height: 180,
              decoration:
                  BoxDecoration(color: Color.fromRGBO(180, 180, 180, 1), borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(
                  Icons.photo,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                height: 42,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Text(
                      text,
                      style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ))
          ]),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: InkWell(onTap: () {}, child: Icon(Icons.close, size: 15, color: Colors.white)),
          )
        ]),
      ),
    );
  }

  saveImage(String key, DesignImage designImage) async {
    final prefs = await SharedPreferences.getInstance();
    if (designImage.type == 'Gallery' || designImage.type == 'Camera') {
      List<int> imageBytes = designImage.image.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      prefs.setString('${key}type', designImage.type!);

      prefs.setString(key, base64Image);
    } else {
      prefs.setString('${key}type', designImage.type!);

      prefs.setString(key, designImage.image);
    }
  }
}
