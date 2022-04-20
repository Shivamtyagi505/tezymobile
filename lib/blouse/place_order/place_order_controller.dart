import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:quikieappps1/api/place_order/invoice_number_model.dart';
import 'package:quikieappps1/api/place_order/place_order_services.dart';
import 'package:quikieappps1/bill/generate_bill_controller.dart';
import 'package:quikieappps1/blouse/place_order/placeOrder.dart';
import 'package:quikieappps1/blouse/place_order/place_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/custom_datePicker/date_picker_timeline.dart';

class PlaceOrderController extends GenerateBillController {
  InvoiceNumber? invoiceNumber;
  String? dropdownValue = '';
  var month;
  List<int> quantity = [];
  int newContainer = 0;
  List<TextEditingController>? textEditingController = [];
  DatePickerController controller = DatePickerController();
  DateTime selectedValue = DateTime.now();
  List<PlaceOrderList> placeOrderItems = [];
  List<ViewOrderAndMeasurement> viewOrderAndMeasurement = [];
  //Local Data
  var frontImage;
  var backImage;
  var sleevesImage;
  var fabricImage;
  var hangingsImage;
  String? frontImageType;
  String? backImageType;
  String? sleevesImageType;
  bool? cups;
  bool? pipings;
  String? zipType;
  String? hooks;
  String? measurementData;

  Future<void> fetchInvoiceNumberSuggestions() async {
    invoiceNumber = await getInvoiceNumberSuggestion();
    await getDate();
    notifyListeners();
  }

  void incrementCounter(int index) {
    quantity[index]++;
    notifyListeners();
  }

  void decrementCounter(int index) {
    quantity[index]--;
    notifyListeners();
  }

  void addPlaceItems(PlaceOrderList placeOrderList) {
    var check = placeOrderItems.any((element) => element.file == placeOrderList.file).toString();
    if (check == "false") {
      placeOrderItems.add(placeOrderList);
    }
  }

  updateMonth() {
    if (dropdownValue == 'Jan') {
      month = 1;
    } else if (dropdownValue == 'Feb') {
      month = 2;
    } else if (dropdownValue == 'Mar') {
      month = 3;
    } else if (dropdownValue == 'April') {
      month = 4;
    } else if (dropdownValue == 'May') {
      month = 5;
    } else if (dropdownValue == 'June') {
      month = 6;
    } else if (dropdownValue == 'July') {
      month = 7;
    } else if (dropdownValue == 'Aug') {
      month = 8;
    } else if (dropdownValue == 'Sept') {
      month = 9;
    } else if (dropdownValue == 'Oct') {
      month = 10;
    } else if (dropdownValue == 'Nov') {
      month = 11;
    } else if (dropdownValue == 'Dec') {
      month = 12;
    }
    print(month);
    notifyListeners();
  }

  Future<void> getDate() async {
    var dateString = DateTime.now();
    month = dateString.month;
    var formatDate = DateFormat('MMM').format(dateString);
    dropdownValue = formatDate;
  }

  Future<void> getAllLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    measurementData = prefs.getString('measurementData');
    frontImage = prefs.getString("frontImage");
    backImage = prefs.getString("backImage");
    sleevesImage = prefs.getString("sleevesImage");
    fabricImage = prefs.getString("fabricImage");
    hangingsImage = prefs.getString("hangingsImage");
    frontImageType = prefs.getString("frontImagetype");
    backImageType = prefs.getString("backImagetype");
    sleevesImageType = prefs.getString("sleevesImagetype");
    cups = prefs.getBool('cups');
    pipings = prefs.getBool('piping');
    zipType = prefs.getString('zipType');
    hooks = prefs.getString('hooks');
    viewOrderAndMeasurement.add(ViewOrderAndMeasurement(
        data: Map<String, double>.from(jsonDecode(measurementData!)),
        frontImage: frontImage,
        backImage: backImage,
        sleevesImage: sleevesImage,
        frontImageType: frontImageType,
        backImageType: backImageType,
        sleevesImageType: sleevesImageType,
        cups: cups,
        piping: pipings,
        zipType: zipType,
        hooks: hooks,
        fabricImage: fabricImage));
  }

  double? get grandTotalAmount {
    List totalAmount = [];
    if (placeOrderItems.isEmpty) {
      return 0;
    } else {
      for (var i = 0; i < placeOrderItems.length; i++) {
        if (textEditingController!.isNotEmpty) {
          if (textEditingController![i].text.isEmpty) {
            return 0;
          } else {
            double value = double.parse(textEditingController![i].text) * quantity[i];
            totalAmount.add(value);
            return value;
          }
        } else {
          return 0;
        }
      }
      // return totalAmount.;
    }
    // if (textEditingController![0].text.isEmpty) {
    //   return 0;
    // } else {
    //   // if (quantity == 0) {
    //   //   return double.parse(textEditingController.text);
    //   // } else {
    //   //   if (newContainer == 0) {
    //
    //   //   } else {
    //   //     double value = double.parse(textEditingController.text) * quantity;
    //   //     return value * (newContainer + 1);
    //   //   }
    //   // }
    // }
  }
}
