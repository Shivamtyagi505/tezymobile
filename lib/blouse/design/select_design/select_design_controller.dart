import 'package:flutter/material.dart';
import 'package:quikieappps1/api/select_design/select_design_model.dart';
import 'package:quikieappps1/api/select_design/select_design_services.dart';
import 'package:quikieappps1/assets/colors.dart';

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
}
