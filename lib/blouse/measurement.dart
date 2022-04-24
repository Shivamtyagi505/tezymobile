import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quikieappps1/blouse/design/select_design/select_front_design.dart';
import 'package:quikieappps1/blouse/image_class.dart';
import 'package:quikieappps1/excel_data/excel_value.dart';
import 'package:quikieappps1/excel_data/get_Index_for_Scale_value.dart';
import 'package:quikieappps1/state_management/mob_store.dart';

import '../bodymeasure/horizontal_numberpicker_wrapper.dart';

// ignore: must_be_immutable
class MeasurementScreen extends StatefulWidget {
  double selectVal;

  MeasurementScreen({this.selectVal = 8.00});

  @override
  _MeasurementScreenState createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  bool isSelected = false;
  bool ontap = false;
  List<int> arrange = [];
  List<double> items = [];
  List<double> isSelectedItems = [];
  List<String> _listViewData = [
    'Shoulder',
    'Full Length',
    // 'Shoulder Gap',
    'Sleeves Length',
    'Armhole Round',
    // 'Circle Down Loose',
    'Sleeves Round',
    'Upper Chest Round',
    'Lower Chest Round',
    'Waist Round',
    // 'First Dart Point',
    // 'Second Dart Point',
    'Bust Point',
    // 'Front AC',
    'Front Neck Deep',
    'Back Neck Deep',
    'Waist Band Length',
    'Neck Width',
    // 'Chest Round',
    //'Back Neck Width',
  ];
  String selectedImage = "assets/images/3d woman 1.png";
  List<String> deleted = [];
  List images = [
    "assets/images/border.png",
    "assets/images/Customer.png",
    "assets/images/customer1.png",
    "assets/images/customer2.png",
    "assets/images/Group (1).png",
    "assets/images/Group 416.png",
    "assets/images/Group 1067.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
    "assets/images/border.png",
    "assets/images/Customer.png",
    "assets/images/customer1.png",
    "assets/images/customer2.png",
    "assets/images/Group (1).png",
    "assets/images/Group 416.png",
    "assets/images/Group 1067.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 416.png",
    "assets/images/Group 1067.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
    "assets/images/border.png",
    "assets/images/Customer.png",
    "assets/images/customer1.png",
    "assets/images/customer2.png",
    "assets/images/Group (1).png",
    "assets/images/Group 416.png",
    "assets/images/Group 1067.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
    "assets/images/Group 1069.png",
  ];

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  int flag = 0;
  Color abc = Color(0xff032B77);
  int value = 0;
  List<String> delete = [
    'Shoulder Gap',
    'Circle Down Loose',
    'First Dart Point',
    'Second Dart Point',
    'Front AC',
    'Chest Round',
    'Back Neck Width',
  ];

  // ignore: missing_required_param
  List<String> mesuringList = [];
  int FIRST_TIME = 0;
  String getalistName = 'Shoulder';
  ScaleNo scaleData =
      ScaleNo(); //this will set the name of scale and that name of scale will search in map and update the image on scrolling.

  @override
  void initState() {
    super.initState();
    scaleData.setName("Upper Chest Round");
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: new Text(
            'Blouse',
            style: TextStyle(
              fontSize: 24.0,
              color: Color.fromRGBO(3, 43, 119, 10),
              fontWeight: FontWeight.normal,
              fontFamily: 'Productsans',
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                      if (isSelected && FIRST_TIME == 0) {
                        mesuringList.add('Shoulder Gap');
                        mesuringList.add(
                          'Circle Down Loose',
                        );
                        mesuringList.add(
                          'First Dart Point',
                        );
                        mesuringList.add(
                          'Second Dart Point',
                        );
                        mesuringList.add(
                          'Front AC',
                        );
                        mesuringList.add(
                          'Chest Round',
                        );
                        mesuringList.add(
                          'Back Neck Width',
                        );
                        // _listViewData.add('Shoulder');
                        //delete.add('Shoulder');
                        FIRST_TIME = 1;
                      }

                      if (!delete.isEmpty) {
                        delete.forEach((element) {
                          _listViewData.remove(element);

                          deleted.add(element);
                          flag = 0;
                        });
                      }
                    });
                    if (isSelected) {
                      if (!deleted.isEmpty) {
                        deleted.forEach((element) {
                          if (!_listViewData.contains(element)) {
                            setState(() {
                              _listViewData.add(element);
                              _listViewData.forEach((element) {
                                if (!arrange.contains(returnindex.indexOf(element)))
                                  arrange.add(returnindex.indexOf(element));
                              });
                              arrange.sort();
                              _listViewData.clear();
                              arrange.forEach((element) {
                                _listViewData.add(returnindex.elementAt(element));
                              });
                            });
                          }
                        });
                      }
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        isSelected ? Icons.check : Icons.settings,
                        color: Color.fromRGBO(3, 43, 119, 10),
                      ),
                      Text(
                        isSelected ? 'Done' : 'Edit',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromRGBO(3, 43, 119, 10),
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Productsans',
                        ),
                      ),
                    ],
                  ),
                )),
          ],
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20.0,
                color: Color.fromRGBO(3, 43, 119, 10),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              }),
        ),
        body: Container(
            child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(left: 250, bottom: 10),
                child: Text(
                  'Scroll to Select',
                  style: TextStyle(
                    color: Color(0xff032B77),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 150, bottom: 10),
                child: Image.asset(
                  "assets/images/Scroll To Select.png",
                  height: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: 200,
                        child: Observer(
                            builder: (_) => Image.asset(
                                  '${new ImageClass().imageSelect[scaleData.name]}',
                                )),
                      )),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Text(
              'Select Measurement Below',
              style: TextStyle(fontSize: 20.0, fontFamily: 'Productsans', color: Color.fromRGBO(3, 43, 119, 10)),
              textAlign: TextAlign.center,
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            isSelected
                ? Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                      width: width / 1.6,
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: _listViewData.length,
                          itemBuilder: (context, index) {
                            isSelectedItems = getdataval[widget.selectVal]!;
                            mesuringList.add('Soulder');
                            return InkWell(
                              onTap: () {
                                // selectedImage = images[index];
                                changeImageOnScroll(index);
                              },
                              child: Stack(children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 0),
                                  width: width * 0.6,
                                  decoration: BoxDecoration(
                                    color: (mesuringList.contains(_listViewData[index]))
                                        ? Color(0xff979797)
                                        : Color.fromRGBO(3, 43, 119, 1),
                                    border: Border.all(
                                        color: Colors.black, // Set border color
                                        width: 1.0), // Set border width
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)), // Set rounded corner radius
                                    // Make rounded corner of border
                                  ),
                                  child: HorizontalNumberPickerWrapper(
                                    scaleTextColor: Colors.black,
                                    scaleColor: (mesuringList.contains(_listViewData[index]))
                                        ? Color(0xff979797)
                                        : Color.fromRGBO(3, 43, 119, 1),
                                    initialValue: /*getdataval[50.00][index]*/ widget.selectVal < 18.25
                                        ? ((getdataval[widget.selectVal]![returnindex.indexOf(_listViewData[index])]) *
                                                4) -
                                            3
                                        : ((new Abc(widget.selectVal).bb[returnindex.indexOf(_listViewData[index])]) *
                                                4) -
                                            3,
                                    minValue: 1,
                                    maxValue: 201,
                                    step: 1,
                                    unit: 'CM',
                                    name: _listViewData[index],
                                    widgetWidth: MediaQuery.of(context).size.width.round(),
                                    subGridCountPerGrid: 10,
                                    subGridWidth: 8,
                                    onSelectedChanged: (value) {
                                      var updatedValue = getUpdatedValue(value);
                                      getdataval[widget.selectVal]![returnindex.indexOf(_listViewData[index])] =
                                          updatedValue + 1;
                                      isSelectedItems = getdataval[widget.selectVal]!;
                                      if (_listViewData[index] == 'Shoulder') scaleData.setName('Shoulder');
                                      if (_listViewData[index] == 'Full Length') scaleData.setName('Full Length');
                                      if (_listViewData[index] == 'Shoulder Gap') scaleData.setName('Shoulder Gap');
                                      if (_listViewData[index] == 'Sleeves Length') scaleData.setName('Sleeves Length');
                                      if (_listViewData[index] == 'Armhole Round') scaleData.setName('Armhole Round');
                                      if (_listViewData[index] == 'Circle Down Loose')
                                        scaleData.setName('Circle Down Loose');
                                      if (_listViewData[index] == 'Sleeves Round') scaleData.setName('Sleeves Round');
                                      if (_listViewData[index] == 'Upper Chest Round')
                                        scaleData.setName('Upper Chest Round');
                                      if (_listViewData[index] == 'Lower Chest Round')
                                        scaleData.setName('Lower Chest Round');
                                      if (_listViewData[index] == 'Waist Round') scaleData.setName('Waist Round');
                                      if (_listViewData[index] == 'First Dart Point')
                                        scaleData.setName('First Dart Point');
                                      if (_listViewData[index] == 'Second Dart Point')
                                        scaleData.setName('Second Dart Point');
                                      if (_listViewData[index] == 'Bust Point') scaleData.setName('Bust Point');
                                      if (_listViewData[index] == 'Front AC') scaleData.setName('Front AC');
                                      if (_listViewData[index] == 'Front Neck Deep')
                                        scaleData.setName('Front Neck Deep');
                                      if (_listViewData[index] == 'Back Neck Deep') scaleData.setName('Back Neck Deep');
                                      if (_listViewData[index] == 'Waist Band Length')
                                        scaleData.setName('Waist Band Length');
                                      if (_listViewData[index] == 'Neck Width') scaleData.setName('Neck Width');
                                      if (_listViewData[index] == 'Back Neck Width')
                                        scaleData.setName('Back Neck Width');
                                      if (_listViewData[index] == 'Chest Round') scaleData.setName('Chest Round');
                                    },
                                  ),
                                ),
                                isSelected
                                    ? (mesuringList.contains(_listViewData[index]))
                                        ? Positioned(
                                            left: MediaQuery.of(context).size.width / 2,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  mesuringList.remove(_listViewData[index]);
                                                  if (!delete.isEmpty) {
                                                    if (delete.contains(_listViewData[index])) {
                                                      delete.remove(_listViewData[index]);
                                                    }
                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.white, borderRadius: BorderRadius.circular(100)),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Color(0xff032B77),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Positioned(
                                            left: MediaQuery.of(context).size.width / 2,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  flag = 0;
                                                  mesuringList.add(_listViewData[index]);
                                                  if (!delete.contains(index)) {
                                                    if (!delete.contains(index)) {
                                                      delete.add(_listViewData[index]);
                                                    }
                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.white, borderRadius: BorderRadius.circular(100)),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Color(0xff032B77),
                                                ),
                                              ),
                                            ),
                                          )
                                    : Container(),
                              ]),
                            );
                          }),
                    ),
                  )
                : Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                      width: width / 1.6,
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: _listViewData.length,
                          itemBuilder: (context, index) {
                            items = getdataval[widget.selectVal]!;
                            return InkWell(
                              onTap: () {
                                // selectedImage = images[index];
                                changeImageOnScroll(index);
                              },
                              child: Stack(children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 0),
                                  width: width * 0.6,
                                  decoration: BoxDecoration(
                                    color: (mesuringList.contains(_listViewData[index]))
                                        ? Color(0xff979797)
                                        : Color.fromRGBO(3, 43, 119, 1),
                                    border: Border.all(
                                        color: Colors.black, // Set border color
                                        width: 1.0), // Set border width
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)), // Set rounded corner radius
                                    // Make rounded corner of border
                                  ),
                                  child: HorizontalNumberPickerWrapper(
                                    scaleTextColor: Colors.black,
                                    scaleColor: (mesuringList.contains(_listViewData[index]))
                                        ? Color(0xff979797)
                                        : Color.fromRGBO(3, 43, 119, 1),
                                    initialValue: /*getdataval[50.00][index]*/ widget.selectVal < 18.25
                                        ? ((getdataval[widget.selectVal]![returnindex.indexOf(_listViewData[index])]) *
                                                4) -
                                            3
                                        : ((new Abc(widget.selectVal).bb[returnindex.indexOf(_listViewData[index])]) *
                                                4) -
                                            3,
                                    minValue: 1,
                                    maxValue: 201,
                                    step: 1,
                                    unit: 'CM',
                                    name: _listViewData[index],
                                    widgetWidth: MediaQuery.of(context).size.width.round(),
                                    subGridCountPerGrid: 10,
                                    subGridWidth: 8,
                                    onSelectedChanged: (value) {
                                      var updatedValue = getUpdatedValue(value);
                                      getdataval[widget.selectVal]![returnindex.indexOf(_listViewData[index])] =
                                          updatedValue + 1;
                                      items = getdataval[widget.selectVal]!;
                                      if (_listViewData[index] == 'Shoulder') scaleData.setName('Shoulder');
                                      if (_listViewData[index] == 'Full Length') scaleData.setName('Full Length');
                                      if (_listViewData[index] == 'Shoulder Gap') scaleData.setName('Shoulder Gap');
                                      if (_listViewData[index] == 'Sleeves Length') scaleData.setName('Sleeves Length');
                                      if (_listViewData[index] == 'Armhole Round') scaleData.setName('Armhole Round');
                                      if (_listViewData[index] == 'Circle Down Loose')
                                        scaleData.setName('Circle Down Loose');
                                      if (_listViewData[index] == 'Sleeves Round') scaleData.setName('Sleeves Round');
                                      if (_listViewData[index] == 'Upper Chest Round')
                                        scaleData.setName('Upper Chest Round');
                                      if (_listViewData[index] == 'Lower Chest Round')
                                        scaleData.setName('Lower Chest Round');
                                      if (_listViewData[index] == 'Waist Round') scaleData.setName('Waist Round');
                                      if (_listViewData[index] == 'First Dart Point')
                                        scaleData.setName('First Dart Point');
                                      if (_listViewData[index] == 'Second Dart Point')
                                        scaleData.setName('Second Dart Point');
                                      if (_listViewData[index] == 'Bust Point') scaleData.setName('Bust Point');
                                      if (_listViewData[index] == 'Front AC') scaleData.setName('Front AC');
                                      if (_listViewData[index] == 'Front Neck Deep')
                                        scaleData.setName('Front Neck Deep');
                                      if (_listViewData[index] == 'Back Neck Deep') scaleData.setName('Back Neck Deep');
                                      if (_listViewData[index] == 'Waist Band Length')
                                        scaleData.setName('Waist Band Length');
                                      if (_listViewData[index] == 'Neck Width') scaleData.setName('Neck Width');
                                      if (_listViewData[index] == 'Back Neck Width')
                                        scaleData.setName('Back Neck Width');
                                      if (_listViewData[index] == 'Chest Round') scaleData.setName('Chest Round');
                                    },
                                  ),
                                ),
                                isSelected
                                    ? (mesuringList.contains(_listViewData[index]))
                                        ? Positioned(
                                            left: MediaQuery.of(context).size.width / 2,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  mesuringList.remove(_listViewData[index]);
                                                  if (!delete.isEmpty) {
                                                    if (delete.contains(_listViewData[index])) {
                                                      delete.remove(_listViewData[index]);
                                                    }
                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.white, borderRadius: BorderRadius.circular(100)),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Color(0xff032B77),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Positioned(
                                            left: MediaQuery.of(context).size.width / 2,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  mesuringList.add(_listViewData[index]);
                                                  if (!delete.contains(index)) {
                                                    if (!delete.contains(index)) {
                                                      delete.add(_listViewData[index]);
                                                    }
                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.white, borderRadius: BorderRadius.circular(100)),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Color(0xff032B77),
                                                ),
                                              ),
                                            ),
                                          )
                                    : Container(),
                              ]),
                            );
                          }),
                    ),
                  ),
          ])
        ])),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/Previous.png"),
              ),
              FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => select_front_design()),
                  );
                },
                child: Image.asset("assets/images/Next.png"),
              )
            ],
          ),
        ));
  }

  double getUpdatedValue(val) {
    double base = 1.00;
    double finalva = ((((val / 1 - (val % 1)) - base)) * 0.25) + (val % 1);
    return finalva;
  }

  void changeImageOnScroll(int index) {
    if (_listViewData[index] == 'Shoulder') scaleData.setName('Shoulder');
    if (_listViewData[index] == 'Full Length') scaleData.setName('Full Length');
    if (_listViewData[index] == 'Shoulder Gap') scaleData.setName('Shoulder Gap');
    if (_listViewData[index] == 'Sleeves Length') scaleData.setName('Sleeves Length');
    if (_listViewData[index] == 'Armhole Round') scaleData.setName('Armhole Round');
    if (_listViewData[index] == 'Circle Down Loose') scaleData.setName('Circle Down Loose');
    if (_listViewData[index] == 'Sleeves Round') scaleData.setName('Sleeves Round');
    if (_listViewData[index] == 'Upper Chest Round') scaleData.setName('Upper Chest Round');
    if (_listViewData[index] == 'Lower Chest Round') scaleData.setName('Lower Chest Round');
    if (_listViewData[index] == 'Waist Round') scaleData.setName('Waist Round');
    if (_listViewData[index] == 'First Dart Point') scaleData.setName('First Dart Point');
    if (_listViewData[index] == 'Second Dart Point') scaleData.setName('Second Dart Point');
    if (_listViewData[index] == 'Bust Point') scaleData.setName('Bust Point');
    if (_listViewData[index] == 'Front AC') scaleData.setName('Front AC');
    if (_listViewData[index] == 'Front Neck Deep') scaleData.setName('Front Neck Deep');
    if (_listViewData[index] == 'Back Neck Deep') scaleData.setName('Back Neck Deep');
    if (_listViewData[index] == 'Waist Band Length') scaleData.setName('Waist Band Length');
    if (_listViewData[index] == 'Neck Width') scaleData.setName('Neck Width');
    if (_listViewData[index] == 'Back Neck Width') scaleData.setName('Back Neck Width');
    if (_listViewData[index] == 'Chest Round') scaleData.setName('Chest Round');
  }
}
