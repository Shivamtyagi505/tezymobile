import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/blouse/design/after_selection.dart';
import 'package:quikieappps1/blouse/design/select_design/select_design_controller.dart';
import 'package:quikieappps1/blouse/design/select_design/select_back_design.dart';


class select_front_design extends StatefulWidget {
  @override
  select_front_designState createState() => select_front_designState();
}

class select_front_designState extends State<select_front_design> {
  int? _index;
  File? _image;
  final picker = ImagePicker();
  DesignImage? frontDesignImage = DesignImage();

  Future _imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if(pickedFile != null)
      _image = File(pickedFile.path);
      frontDesignImage!.image = _image;
      frontDesignImage!.type = 'Camera';
    });
  }

  Future _imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if(pickedFile != null)
      _image = File(pickedFile.path);
      frontDesignImage!.image = _image;
      frontDesignImage!.type = 'Gallery';
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

  Widget frontDesign(String text, var image) {
    return InkWell(
      onDoubleTap: () {
        setState(() {
          frontDesignImage!.image = image;
          frontDesignImage!.type = 'Categorie';
        });
      },
      onTap: () async {
        var data = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => After_Selection_image(
                      image: image,
                    )));
        if (data != null) {
          setState(() {
            frontDesignImage!.image = data;
            frontDesignImage!.type = 'Categorie';
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'http://172.105.253.131:1337$image',
                  fit: BoxFit.fill,
                  width: double.maxFinite,
                )),
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

@override
  void initState() {
    var provider = Provider.of<BlouseSelectDesignController>(context,listen: false);
    provider.fetchSelectFrontDesignApi();
    provider.splitHastTag();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<BlouseSelectDesignController>(builder: (context, value, child) {
      return value.selectFrontDesign == null
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Select Front Design",
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
                                hintText: "Search...",
                                prefixIcon: Icon(Icons.search),
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
                                frontDesignImage!.image == null 
                                    ? Container(
                                        child: Expanded(
                                          child: Stack(alignment: Alignment.topRight, children: [
                                            Stack(alignment: Alignment.bottomCenter, children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 3),
                                                height: 180,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(180, 180, 180, 1),
                                                    borderRadius: BorderRadius.circular(10)),
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
                                                        'Front Design',
                                                        style: TextStyle(
                                                            color: textColor,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w500),
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
                                              (frontDesignImage!.image != null && frontDesignImage!.type == 'Gallery' || frontDesignImage!.type == 'Camera')
                                              ?Container(
                                                margin: EdgeInsets.symmetric(horizontal: 3),
                                                height: 180,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(180, 180, 180, 1),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8),
                                                    child: Image.file(
                                                      frontDesignImage!.image,
                                                      fit: BoxFit.cover,
                                              )),
                                              )
                                              :Container(
                                                margin: EdgeInsets.symmetric(horizontal: 3),
                                                height: 180,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(180, 180, 180, 1),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8),
                                                    child: Image.network(
                                                      'http://172.105.253.131:1337${frontDesignImage!.image}',
                                                      fit: BoxFit.cover,
                                                    )),
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
                                                        'Front Design',
                                                        style: TextStyle(
                                                            color: textColor,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w500),
                                                      ),
                                                      Expanded(child: SizedBox()),
                                                    ],
                                                  ))
                                            ]),
                                            Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      frontDesignImage!.image = null; 
                                                    });
                                                  },
                                                  child: Icon(Icons.close, size: 15, color: Colors.white)),
                                            )
                                          ]),
                                        ),
                                      ),
                               value.imageContainer("Back Design"),
                                value.imageContainer("Sleeve Design"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: StaggeredGridView.countBuilder(
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 12,
                                itemCount: value.selectFrontDesignClass!.length,
                                itemBuilder: (BuildContext context, int index) => frontDesign(
                                    value.selectFrontDesignClass![index].attributes!.productName!,
                                    value.selectFrontDesignClass![index].attributes!.image!.data!.attributes!.formats!
                                        .large!.url),
                                staggeredTileBuilder: (index) {
                                  return StaggeredTile.count(1, index.isEven ? 1.4 : 1.8);
                                }),
                          ),
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
                    Navigator.pop(context);
                  }
                  if (val == 1) {
                    // if (frontImage == null) {
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return AlertDialog(
                      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      //       title: Text('Tezy Tailor'),
                      //       content: Text('Select Any Front Design!!'),
                      //       actions: [
                      //         FlatButton(
                      //           textColor: Colors.black,
                      //           onPressed: () {
                      //             Navigator.pop(context);
                      //           },
                      //           child: Text('CANCEL'),
                      //         ),
                      //         FlatButton(
                      //           textColor: Colors.black,
                      //           onPressed: () {
                      //             Navigator.pop(context);
                      //           },
                      //           child: Text('OK'),
                      //         ),
                      //       ],
                      //     );
                    //    },
                    //  );
                    // } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => select_back_design(
                                  frontImage: frontDesignImage!.image,
                                  type: frontDesignImage!.type,
                                )),
                      );
                    }
                  // }
                },
                currentIndex: 0,
                items: [
                  BottomNavigationBarItem(label: '', icon: Image.asset('assets/images/Previous.png')),

                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/Group 416.png'),
                    label: '',
                  ),
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
    });
  }
}


class DesignImage{
  var image;
  String? type;
  DesignImage({this.image,this.type});
}