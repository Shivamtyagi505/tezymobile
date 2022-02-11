import 'package:flutter/cupertino.dart';
import 'package:quikieappps1/api/select_design/select_design_model.dart';
import 'package:quikieappps1/api/select_design/select_design_services.dart';

class BlouseSelectDesignController extends ChangeNotifier {
  ReferenceImageType? selectFrontDesign;
  ReferenceImageType? selectBackDesign;
  ReferenceImageType? selectSleeveDesign;
  List<SelectDesignClass>? selectFrontDesignClass = [];
  List<SelectDesignClass>? selectBackDesignClass = [];
  List<SelectDesignClass>? selectSleeveDesignClass = [];

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
}
