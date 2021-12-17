import 'package:flutter/material.dart';

class ImageNotif extends ChangeNotifier{

  String selectedImage = "assets/images/customer1.png";
  String getImage="assets/images/3d woman 1.png";

  shoulderImage(){

    getImage="assets/images/blousemeasurement/Shoulder.png";
    notifyListeners();
  }
  fullLengthImage(){
    getImage="assets/images/blousemeasurement/Full Length.png";
    notifyListeners();
  }
  shoulderGapImage(){
    getImage="assets/images/blousemeasurement/Shoulder Gap.png";
    notifyListeners();
  }
  sleevesLengthImage(){
    getImage="assets/images/blousemeasurement/Sleeves Length.png";
    notifyListeners();
  }
  armHoleRoundImage(){
    getImage="assets/images/blousemeasurement/Armhole Round.png";
    notifyListeners();
  }
  circleDownLooseImage(){
    getImage="assets/images/blousemeasurement/Circle Down Loose.png";
    notifyListeners();
  }
  sleevesRoundImage(){
    getImage="assets/images/blousemeasurement/Sleeves Round.png";
    notifyListeners();
  }
  upperChestRoundImage(){
    getImage="assets/images/blousemeasurement/Upper chest Round.png";
    notifyListeners();
  }
  lowerChestRoundImage(){
    getImage="assets/images/blousemeasurement/Lower Chest Round.png";
    notifyListeners();
  }
  waistRoundImage(){
    getImage="assets/images/blousemeasurement/Waist Round.png";
    notifyListeners();
  }
  firstDartPointImage(){
    getImage="assets/images/blousemeasurement/First Dart Point.png";
    notifyListeners();
  }
  secondDartPointImage(){
    getImage="assets/images/blousemeasurement/Second Dart Point.png";
    notifyListeners();
  }
  bustPointImage(){
    getImage="assets/images/blousemeasurement/Bust Point.png";
    notifyListeners();
  }
  frontAcImage(){
    getImage="assets/images/blousemeasurement/Front AC.png";
    notifyListeners();
  }
  frontNeckDeepImage(){
    getImage="assets/images/blousemeasurement/Front Neck Deep.png";
    notifyListeners();
  }
  backNeckDeepImage(){
    getImage="assets/images/blousemeasurement/Back Neck Deep.png";
    notifyListeners();
  }
  waistBandLengthImage(){
    getImage="assets/images/blousemeasurement/Waist Band Length.png";
    notifyListeners();
  }
  neckWidthImage(){
    getImage="assets/images/blousemeasurement/Neck Width.png";
    notifyListeners();
  }
}