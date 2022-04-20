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
  File? file;
  int? quantity;
  String? price;

  double get priceTotal {
    var value = double.parse(price!) * quantity!;
    return value;
  }

  PlaceOrderList(this.orderType, this.file, {this.quantity, this.price});
}
