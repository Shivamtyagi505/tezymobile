import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:quikieappps1/assets/colors.dart';

import 'package:quikieappps1/blouse/design/after_selection.dart';
import 'package:quikieappps1/blouse/design/controller/select_design_controller.dart';
import 'package:quikieappps1/blouse/design/select_back_design.dart';
import 'package:quikieappps1/blouse/preview_order/previewOrder_blouse.dart';

class select_sleeve_design extends StatefulWidget {
  @override
  select_sleeve_designState createState() => select_sleeve_designState();
}

class select_sleeve_designState extends State<select_sleeve_design> {
  int? _index;
  File? _image;
  File? _backImage;
  var loading = false;
  bool isSelected =false;
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

  Widget design(String text,var image) {
    return InkWell(
      onDoubleTap: (){
        setState(() {
          isSelected=!isSelected;
        });
      },
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => After_Selection_image()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: darkGrey),
            child: Image.asset(image),
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
    return Consumer<BlouseSelectDesignController>(
      builder: (context,value,child) {
        value.fetchSelectSleeveDesignApi();
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                                Text("Select Sleeves Design",
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      imageContainer("Front Design"),
                      imageContainer("Back Design"),
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
                                        'Sleeve Design',
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
                                        'Sleeve Design',
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: MasonryGridView.count(
                          physics: ScrollPhysics(),
                          itemCount: value.selectSleeveDesignClass!.length,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          itemBuilder: (context, index) {
                            return design(value.selectSleeveDesignClass![index].attributes!.productName!,value.selectSleeveDesignClass![index].attributes!.image!.data!.attributes!.name);
                          },
                        ),
                      ),
              ],
            ),
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
                  MaterialPageRoute(builder: (context) => select_back_design(isSelected)),
                );
                // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: DailyLiaScreen()));
              }
              if (val == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreviewOrdersBlouse()),
                );
                // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: MyHomePage()));
              }
            },
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(title: Text(''), icon: Image.asset('assets/images/Previous.png')),

              BottomNavigationBarItem(
                icon: Image.asset('assets/images/Next1.png'),
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
    );
  }
}
