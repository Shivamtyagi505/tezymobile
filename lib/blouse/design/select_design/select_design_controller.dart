import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/api/select_design/select_design_model.dart';
import 'package:quikieappps1/api/select_design/select_design_services.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/bill/generate_bill_controller.dart';
import 'package:quikieappps1/blouse/design/select_design/select_front_design.dart';
import 'package:quikieappps1/home/home_page/homepage_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlouseSelectDesignController extends GenerateBillController {
  ReferenceImageType? selectFrontDesign;
  ReferenceImageType? selectBackDesign;
  ReferenceImageType? selectSleeveDesign;
  ReferenceImageType? selectBottomOtherDesign;
  List<SelectDesignClass>? selectFrontDesignClass = [];
  List<SelectDesignClass>? selectBackDesignClass = [];
  List<SelectDesignClass>? selectSleeveDesignClass = [];
  List<SelectDesignClass>? selectBottomOtherClass = [];
  File? _frontimage;
  final picker = ImagePicker();
  DesignImage? frontDesignImage = DesignImage();
  File? _backimage;
  var backImage;
  DesignImage? backDesignImage = DesignImage();
  File? _sleevesimage;
  DesignImage? sleeveDesignImage = DesignImage();
  DesignImage? bottomDesignImage = DesignImage();
  File? _bottomimage;
  var frontImageUrl;
  var backImageUrl;
  var sleevesImageUrl;
  int frontIndex = 0;
  int backIndex = 0;
  int sleevesIndex = 0;

  Future imgFromCameraSleeves(BuildContext context) async {
    var provider = Provider.of<HomepageController>(context, listen: false);
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) _sleevesimage = File(pickedFile.path);
    sleeveDesignImage!.image = _sleevesimage;
    sleeveDesignImage!.type = 'Camera';
    if (sleeveDesignImage!.image != null) {
      frontIndex++;
    }
    files.putIfAbsent('files.sleevesImage_${provider.productName}$frontIndex', () => sleeveDesignImage!.image);
    notifyListeners();
  }

  Future imgFromGallerySleeves(BuildContext context) async {
    var provider = Provider.of<HomepageController>(context, listen: false);
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) _sleevesimage = File(pickedFile.path);
    sleeveDesignImage!.image = _sleevesimage;
    sleeveDesignImage!.type = 'Gallery';
    if (sleeveDesignImage!.image != null) {
      frontIndex++;
    }
    files.putIfAbsent('files.sleevesImage_${provider.productName}$frontIndex', () => sleeveDesignImage!.image);
    notifyListeners();
  }

  Future imgFromCameraBack(BuildContext context) async {
    var provider = Provider.of<HomepageController>(context, listen: false);
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) _backimage = File(pickedFile.path);
    backDesignImage!.image = _backimage;
    backDesignImage!.type = 'Camera';
    if (backDesignImage!.image != null) {
      backIndex++;
    }
    files.putIfAbsent('files.backImage_${provider.productName}$backIndex', () => backDesignImage!.image);
    notifyListeners();
  }

  Future imgFromGalleryBack(BuildContext context) async {
    var provider = Provider.of<HomepageController>(context, listen: false);
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) _backimage = File(pickedFile.path);
    backDesignImage!.image = _backimage;
    backDesignImage!.type = 'Gallery';
    if (backDesignImage!.image != null) {
      backIndex++;
    }
    files.putIfAbsent('files.backImage_${provider.productName}$backIndex', () => backDesignImage!.image);
    notifyListeners();
  }

  Future imgFromCameraFront(BuildContext context) async {
    var provider = Provider.of<HomepageController>(context, listen: false);
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) _frontimage = File(pickedFile.path);
    frontDesignImage!.image = _frontimage;
    frontDesignImage!.type = 'Camera';
    if (frontDesignImage!.image != null) {
      frontIndex++;
    }
    files.putIfAbsent('files.frontImage_${provider.productName}$frontIndex', () => frontDesignImage!.image);
    notifyListeners();
  }

  Future imgFromGalleryFront(BuildContext context) async {
    var provider = Provider.of<HomepageController>(context, listen: false);
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) _frontimage = File(pickedFile.path);
    frontDesignImage!.image = _frontimage;
    frontDesignImage!.type = 'Gallery';
    if (frontDesignImage!.image != null) {
      frontIndex++;
    }
    files.putIfAbsent('files.frontImage_${provider.productName}$frontIndex', () => frontDesignImage!.image);
    notifyListeners();
  }

  Future imgFromCameraBottom(BuildContext context) async {
    var provider = Provider.of<HomepageController>(context, listen: false);
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) _bottomimage = File(pickedFile.path);
    bottomDesignImage!.image = _bottomimage;
    bottomDesignImage!.type = 'Camera';
    if (bottomDesignImage!.image != null) {
      frontIndex++;
    }
    files.putIfAbsent('files.bottomImage_${provider.productName}$frontIndex', () => bottomDesignImage!.image);
    notifyListeners();
  }

  Future imgFromGalleryBottom(BuildContext context) async {
    var provider = Provider.of<HomepageController>(context, listen: false);
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) _bottomimage = File(pickedFile.path);
    bottomDesignImage!.image = _bottomimage;
    bottomDesignImage!.type = 'Gallery';
    if (bottomDesignImage!.image != null) {
      frontIndex++;
    }
    files.putIfAbsent('files.bottomImage_${provider.productName}$frontIndex', () => bottomDesignImage!.image);
    notifyListeners();
  }

  Future<void> fetchSelectFrontDesignApi(String productName) async {
    selectFrontDesign = await selectDesignApi(productName, 'front');
    selectFrontDesignClass = selectFrontDesign!.data;
    notifyListeners();
  }

  Future<void> fetchSelectBackDesignApi(String productName) async {
    selectBackDesign = await selectDesignApi(productName, 'back');
    selectBackDesignClass = selectBackDesign!.data;
    notifyListeners();
  }

  Future<void> fetchSelectSleeveDesignApi(String productName) async {
    selectSleeveDesign = await selectDesignApi(productName, 'sleeves');
    selectSleeveDesignClass = selectSleeveDesign!.data;
    notifyListeners();
  }

  Future<void> fetchSelectBottomDesignApi(String productName) async {
    selectBottomOtherDesign = await selectBottomOtherDesignApi(productName);
    selectBottomOtherClass = selectBottomOtherDesign!.data;
    notifyListeners();
  }

  void splitHastTag() {
    List hashTags = [];
    for (var i = 0; i < selectBackDesignClass!.length; i++) {
      hashTags.add(selectBackDesignClass![i].attributes!.hashTag);
    }
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
