import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/blouse/design/select_design/select_front_design.dart';
import 'package:quikieappps1/screens/hangings/hangings_controller.dart';

class Hangings extends StatefulWidget {
  @override
  HangingsState createState() => HangingsState();
}

class HangingsState extends State<Hangings> {
  int? _index;
  File? _image;
  final picker = ImagePicker();
  DesignImage? hangingsDesignImage = DesignImage();

  Future _imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (pickedFile != null) _image = File(pickedFile.path);
      hangingsDesignImage!.image = _image;
      hangingsDesignImage!.type = 'Camera';
    });
  }

  Future _imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) _image = File(pickedFile.path);
      hangingsDesignImage!.image = _image;
      hangingsDesignImage!.type = 'Gallery';
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

  Widget category(String text) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(3, 43, 119, 10),
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: labelGrey)),
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ));
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

  Widget hangingDesign(String text, var image) {
    return InkWell(
      onDoubleTap: () {
        setState(() {
          hangingsDesignImage!.image = image;
          hangingsDesignImage!.type = 'Categorie';
        });
      },
      onTap: () async {
        // var data = await Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => After_Selection_image(
        //               image: image,
        //             )));
        // if (data != null) {
        //   setState(() {
        //     frontDesignImage!.image = data;
        //     frontDesignImage!.type = 'Categorie';
        //   });
        // }
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
    var provider = Provider.of<SelectHangingsController>(context, listen: false);
    provider.fetchSelectHangingsApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectHangingsController>(builder: (context, value, child) {
      return Scaffold(
        body: Column(children: [
          Container(
            color: Color.fromRGBO(244, 248, 252, 10),
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
                      icon: Icon(Icons.arrow_back_ios, color: Color.fromRGBO(3, 43, 119, 10)),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text("Select Hangings",
                              style: TextStyle(
                                  color: Color.fromRGBO(3, 43, 119, 10), fontSize: 25, fontWeight: FontWeight.w500)),
                          SizedBox(height: 5),
                          Center(
                            child: Text("Select Design or Upload Your Own",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300)),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 32,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(47),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          hangingsDesignImage!.image == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                'Hangings Design',
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
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(alignment: Alignment.topRight, children: [
                    Stack(alignment: Alignment.bottomCenter, children: [
                      (hangingsDesignImage!.image != null && hangingsDesignImage!.type == 'Gallery' ||
                              hangingsDesignImage!.type == 'Camera')
                          ? Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              height: 180,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(180, 180, 180, 1), borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    hangingsDesignImage!.image,
                                    fit: BoxFit.cover,
                                  )),
                            )
                          : Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              height: 180,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(180, 180, 180, 1), borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'http://172.105.253.131:1337${hangingsDesignImage!.image}',
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
                                'Hangings Design',
                                style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
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
                              hangingsDesignImage!.image = null;
                            });
                          },
                          child: Icon(Icons.close, size: 15, color: Colors.white)),
                    )
                  ]),
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: StaggeredGridView.countBuilder(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  itemCount: value.items!.length,
                  itemBuilder: (BuildContext context, int index) => hangingDesign(
                      value.items![index].attributes!.productName!,
                      value.items![index].attributes!.image!.data!.attributes!.formats!.small!.url),
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.count(1, index.isEven ? 1.4 : 1.8);
                  }),
            ),
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromRGBO(69, 89, 210, 10),
          unselectedItemColor: Colors.black54,
          onTap: (int val) {},
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                  height: 80,
                )),
            BottomNavigationBarItem(
              icon: Container(),
              label: '',
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 10),
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
              Text("Upload Your Photo"),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                height: 50,
                width: double.maxFinite,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(3, 43, 119, 10), borderRadius: BorderRadius.circular(33)),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ])),
      );
    });
  }
}
