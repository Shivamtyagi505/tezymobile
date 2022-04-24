import 'package:quikieappps1/api/select_hangings/select_hangings_model.dart';
import 'dart:io';

class PreviewOrderModel {
  final String? orderItem;
  final double? price;
  final int? quantity;
  final Image? image;
  PreviewOrderModel({this.orderItem, this.price, this.quantity, this.image});
}

class PlaceOrderList {
  String? orderType;
  var file;
  String? productType;
  int? quantity;
  String? price;
  Map<String, double>? data;
  var frontImage;
  var backImage;
  var sleevesImage;
  var hangingsImage;
  bool? cups;
  bool? piping;
  String? zipType;
  String? hooks;

  String get cupsValue {
    if (cups == true) {
      return 'YES';
    } else {
      return 'NO';
    }
  }

  String get pipingValue {
    if (piping == true) {
      return 'YES';
    } else {
      return 'NO';
    }
  }

  double get priceTotal {
    var value = double.parse(price!) * quantity!;
    return value;
  }

  PlaceOrderList(
      {this.orderType,
      this.file,
      this.productType,
      this.data,
      this.frontImage,
      this.backImage,
      this.sleevesImage,
      this.hangingsImage,
      this.cups,
      this.piping,
      this.zipType,
      this.hooks,
      this.quantity,
      this.price});
}
