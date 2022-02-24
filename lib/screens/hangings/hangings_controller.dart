import 'package:flutter/material.dart';
import 'package:quikieappps1/api/select_hangings/select_hangings_model.dart';
import 'package:quikieappps1/api/select_hangings/select_hangings_services.dart';

class SelectHangingsController extends ChangeNotifier {
  HangingsModel? selectHangingsDesign;
  List<HangingsDesignItems>? items = [];

  Future<void> fetchSelectHangingsApi() async {
    selectHangingsDesign = await selectHangingsApi('hangings', 'hangings');
     items = selectHangingsDesign!.hangingsItems;
    notifyListeners();
  }
}
