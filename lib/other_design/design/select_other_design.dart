

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/blouse/design/after_selection.dart';
import 'package:quikieappps1/other_design/preview_order/previewOrder_other.dart';
import 'package:quikieappps1/other_design/selectcustomerother.dart';

class selectotherdesign extends StatefulWidget {
  @override
  selectotherdesignState createState() => selectotherdesignState();
}

class selectotherdesignState extends State<selectotherdesign> {
  int? _index;
  File? _image;
  File? _backImage;
  var loading = false;
  bool isSelected = false;
  final picker = ImagePicker();

  Future _imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  Future _imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  final List<String> _listViewData = [
    'Front Design',
  ];

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget categories(String text) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(55, 55, 55, 1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: labelGrey)),
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ));
  }
  
  Widget design(String text) {
    return InkWell(
      onDoubleTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      onTap: () async{
        var data = await Navigator.push(context, MaterialPageRoute(builder: (context) => After_Selection_image()));
        setState(() {
          isSelected =! isSelected;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: darkGrey),
            child: Image.asset('assets/images/3d woman 1.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 5, bottom: 10),
            child: Text(
              text,
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
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
            child: InkWell(
              onTap: (){
                setState(() {
                  isSelected =false;
                });
              },
              child: Icon(Icons.close, size: 15, color: Colors.white)),
          )
        ]),
      ),
    );
  }

  Widget designSmall(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 195,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: darkGrey),
          child: Image.asset('assets/images/3d woman 1.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 5, bottom: 10),
          child: Text(text, style: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: primaryColor,
            child: Column(
              children: [
                SizedBox(height: 35),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Select Design",
                                style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500)),
                            SizedBox(height: 5),

                          ],
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 7), // changes position of shadow
                          ),
                        ],
                        color: Colors.grey),
                    child: TextField(
                      onChanged: (value) {},
                      //  controller: editingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // labelText: "Search...",
                        hintText:"Search..." ,
                        prefixIcon:Icon(Icons.search) ,
                        suffixIcon: Icon(Icons.clear_rounded),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      categories("Boat Neck"),
                      categories("High Neck"),
                      categories("U Neck"),
                      categories("Collar"),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  isSelected == false
                  ?Container(
                    child: Expanded(
                      child: Stack(alignment: Alignment.topRight, children: [
                        Stack(alignment: Alignment.bottomCenter, children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            height: 180,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(180, 180, 180, 1), borderRadius: BorderRadius.circular(10)),
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
                                    'Select Design',
                                    style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                  Expanded(child: SizedBox()),
                                ],
                              ))
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Icon(Icons.close, size: 15, color: Colors.white),
                        )
                      ]),
                    ),
                  )
                  : Container(
                    child: Expanded(
                      child: Stack(alignment: Alignment.topRight, children: [
                        Stack(alignment: Alignment.bottomCenter, children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            height: 180,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(180, 180, 180, 1), borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Image.asset('assets/images/3d woman 1.png')
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
                                    'Select Design',
                                    style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                  Expanded(child: SizedBox()),
                                ],
                              ))
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                isSelected=!isSelected;
                              });
                            },
                            child: Icon(Icons.close, size: 15, color: Colors.white)),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
                   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          design("Scrlet Blouse Design"),
                          design("Scrlet Blouse Design"),
                          design("Scrlet Blouse Design")
                        ],
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          designSmall("Scrlet Blouse Design"),
                          design("Scrlet Blouse Design"),
                          design("Scrlet Blouse Design"),
                          SizedBox(height: 50)
                        ],
                      ),
                    )
                  ],
                ),
              )
                ],
              ),
            ),
          ),
         
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromRGBO(69, 89, 210, 10),
        unselectedItemColor: Colors.black54,
        onTap: (int val) {
          setState(() {
            _index = val;
          });

          if (val == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => selectcustomerother()),
            );
            // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: DailyLiaScreen()));
          }
          if (val == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PreviewOrderOther()),
            );
            // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: MyHomePage()));
          }
        },
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(title: Text(''), icon: Image.asset('assets/images/Previous.png')),

          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Group 416.png'),
            title: Text(''),
          ),

          //FloatingNavbarItem(icon: Icons.help_outline_rounded, title: 'Help Desk'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            FloatingActionButton(
              backgroundColor: Color.fromRGBO(3, 43, 119, 10),
              onPressed: () {
                _showPicker(context);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            Text("Upload Your Photo")
          ])),
    );
  }
}
