import 'dart:convert';

import 'package:quikieappps1/bill/generate_bill_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeasurementController extends GenerateBillController {
  List<double> isSelectedItems = [];

  List<double> items = [];

  Map<String, double>? data = {};

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }
}
