import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quikieappps1/bodymeasure/horizontal_numberpicker_wrapper.dart';
import 'package:quikieappps1/bottomdesign/bottomimage_class.dart';
import 'package:quikieappps1/bottomdesign/design/select_other_design.dart';
import 'package:quikieappps1/excel_data/excel_value.dart';
import 'package:quikieappps1/excel_data/get_Index_for_Scale_value.dart';
import 'package:quikieappps1/state_management/mob_store.dart';

class HomePage extends StatefulWidget {
  double selectVal;

  HomePage({this.selectVal = 8.00});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSelected = false;
  bool ontap = false;

  List<String> _listViewData = [
    'Full Length',
    'Waist Band',
    'Hip',
    'Thigh Round',
    'Knee Round',
    'Knee Length',
    //'Crotch Length',
    //'Anckle Round',
  ];
  String selectedImage = "assets/images/3d woman 1.png";
  List<String> deleted = [];

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  int flag = 0;
  Color abc = Color(0xff032B77);
  int value = 0;
  List<String> delete = [
    'Crotch Length',
    'Anckle Round',
  ];
  List<String> mesuringList = [];
  int FIRST_TIME = 0;
  String getalistName = 'Shoulder';
  ScaleNo scaleData =
      ScaleNo(); //this will set the name of scale and that name of scale will search in map and update the image on scrolling.
  List<int> arrange = [];
  @override
  void initState() {
    super.initState();
    scaleData.setName("Hip");
  }

  @override
  Widget build(BuildContext context) {
    //selectedImage=imageNotif.getImage;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          elevation: 0,
          // backgroundColor: Color.fromRGBO(229, 229, 229, 10),
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
                        mesuringList.add(
                          'Crotch Length',
                        );
                        mesuringList.add(
                          'Anckle Round',
                        );
                        // _listViewData.add('Shoulder');
                        //delete.add('Shoulder');
                        FIRST_TIME = 1;
                      }

                      if (!delete.isEmpty) {
                        delete.forEach((element) {
                          print("hello delete item name  ${element}");
                          _listViewData.remove(element);

                          deleted.add(element);
                          flag = 0;
                        });
                      }
                    });
                    if (isSelected) {
                      print("enter in isSelected");
                      if (!deleted.isEmpty) {
                        print("enter in !deleted.isEmpty");
                        deleted.forEach((element) {
                          if (!_listViewData.contains(element)) {
                            print(" !_listViewData.contains(element) $element");
                            setState(() {
                              _listViewData.add(element);
                              _listViewData.forEach((element) {
                                if (!arrange.contains(returnindexonlybottommeasurement.indexOf(element)))
                                  arrange.add(returnindexonlybottommeasurement.indexOf(element));
                              });
                              arrange.sort();
                              _listViewData.clear();
                              arrange.forEach((element) {
                                _listViewData.add(returnindexonlybottommeasurement.elementAt(element));
                                //  print('arrange element data $element');
                              });
                            });
                          }
                        });
                        // deleted.clear();

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
                                    initialValue: /*getdataval[50.00][index]*/ widget.selectVal == 100.25
                                        ? ((getdataval[widget.selectVal]![
                                                    returnindexonlybottommeasurement.indexOf(_listViewData[index])]) *
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
                                      if (_listViewData[index] == 'Hip') scaleData.setName('Hip');
                                      if (_listViewData[index] == 'Full Length') scaleData.setName('Full Length');
                                      if (_listViewData[index] == 'Waist Band') scaleData.setName('Waist Band');
                                      if (_listViewData[index] == 'Thigh Round') scaleData.setName('Thigh Round');
                                      if (_listViewData[index] == 'Knee Round') scaleData.setName('Knee Round');
                                      if (_listViewData[index] == 'Knee Length') scaleData.setName('Knee Length');
                                      if (_listViewData[index] == 'Crotch Length') scaleData.setName('Crotch Length');
                                      if (_listViewData[index] == 'Anckle Round') scaleData.setName('Anckle Round');
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
                            print("helloooooooo  :" + widget.selectVal.toString());
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
                                    initialValue: /*getdataval[50.00][index]*/ widget.selectVal == 100.25
                                        ? ((getdataval[widget.selectVal]![
                                                    returnindexonlybottommeasurement.indexOf(_listViewData[index])]) *
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
                                      if (_listViewData[index] == 'Hip') scaleData.setName('Hip');
                                      if (_listViewData[index] == 'Full Length') scaleData.setName('Full Length');
                                      if (_listViewData[index] == 'Waist Band') scaleData.setName('Waist Band');
                                      if (_listViewData[index] == 'Thigh Round') scaleData.setName('Thigh Round');
                                      if (_listViewData[index] == 'Knee Round') scaleData.setName('Knee Round');
                                      if (_listViewData[index] == 'Knee Length') scaleData.setName('Knee Length');
                                      if (_listViewData[index] == 'Crotch Length') scaleData.setName('Crotch Length');
                                      if (_listViewData[index] == 'Anckle Round') scaleData.setName('Anckle Round');
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
                onPressed: () {
                  /*  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => input_sample()),
                  );*/
                },
                child: Image.asset("assets/images/Previous.png"),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => selectotherdesign()),
                  );
                },
                child: Image.asset("assets/images/Next.png"),
              )
            ],
          ),
        ));
  }

  void changeImageOnScroll(int index) {
    if (_listViewData[index] == 'Hip') scaleData.setName('Hip');
    if (_listViewData[index] == 'Full Length') scaleData.setName('Full Length');
    if (_listViewData[index] == 'Waist Band') scaleData.setName('Waist Band');
    if (_listViewData[index] == 'Thigh Round') scaleData.setName('Thigh Round');
    if (_listViewData[index] == 'Knee Round') scaleData.setName('Knee Round');
    if (_listViewData[index] == 'Knee Length') scaleData.setName('Knee Length');
    if (_listViewData[index] == 'Crotch Length') scaleData.setName('Crotch Length');
    if (_listViewData[index] == 'Anckle Round') scaleData.setName('Anckle Round');
  }
}
