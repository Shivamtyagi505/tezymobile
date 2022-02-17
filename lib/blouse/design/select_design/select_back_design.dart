import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/blouse/design/after_selection.dart';
import 'package:quikieappps1/blouse/design/select_design/select_design_controller.dart';
import 'package:quikieappps1/blouse/design/select_design/select_front_design.dart';
import 'package:quikieappps1/blouse/design/select_design/select_sleeve_design.dart';

class select_back_design extends StatefulWidget {
  var frontImage;
  String? type;
  select_back_design({this.frontImage, this.type});
  @override
  select_back_designState createState() => select_back_designState();
}

class select_back_designState extends State<select_back_design> {
  int? _index;
  File? _image;
  final picker = ImagePicker();
  var backImage;
  DesignImage? backDesignImage = DesignImage();

  Future _imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (pickedFile != null) _image = File(pickedFile.path);
      backDesignImage!.image = _image;
      backDesignImage!.type = 'Camera';
    });
  }

  Future _imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) _image = File(pickedFile.path);
      backDesignImage!.image = _image;
      backDesignImage!.type = 'Gallery';
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

  Widget imageContainerDependsOnFrontSection(String text) {
    return widget.frontImage == null
        ? Container(
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
                            'Front Design',
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
                  (widget.frontImage != null && widget.type == 'Gallery' || widget.type == 'Camera')
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          height: 180,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(180, 180, 180, 1), borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                widget.frontImage,
                                fit: BoxFit.cover,
                              )),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          height: 180,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(180, 180, 180, 1), borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'http://172.105.253.131:1337${widget.frontImage}',
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
                      onTap: () {
                        setState(() {
                          widget.frontImage = null;
                        });
                      },
                      child: Icon(Icons.close, size: 15, color: Colors.white)),
                )
              ]),
            ),
          );
  }

  Widget backDesign(String text, var image) {
    return InkWell(
      onDoubleTap: () {
        setState(() {
          backDesignImage!.image = image;
          backDesignImage!.type = 'Categorie';
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
            backDesignImage!.image = data;
            backDesignImage!.type = 'Categorie';
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
    var provider = Provider.of<BlouseSelectDesignController>(context, listen: false);
    provider.fetchSelectBackDesignApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BlouseSelectDesignController>(builder: (context, value, child) {
      return value.selectBackDesign == null
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Select Back Design",
                                        style:
                                            TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500)),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          imageContainerDependsOnFrontSection("Front Design"),
                          backDesignImage!.image == null
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
                                                  'Back Design',
                                                  style: TextStyle(
                                                      color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
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
                                        (backDesignImage!.image != null && backDesignImage!.type == 'Gallery' ||
                                                backDesignImage!.type == 'Camera')
                                            ? Container(
                                                margin: EdgeInsets.symmetric(horizontal: 3),
                                                height: 180,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(180, 180, 180, 1),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8),
                                                    child: Image.file(
                                                      backDesignImage!.image,
                                                      fit: BoxFit.cover,
                                                    )),
                                              )
                                            : Container(
                                                margin: EdgeInsets.symmetric(horizontal: 3),
                                                height: 180,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(180, 180, 180, 1),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8),
                                                    child: Image.network(
                                                      'http://172.105.253.131:1337${backDesignImage!.image}',
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
                                                  'Back Design',
                                                  style: TextStyle(
                                                      color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
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
                                                backDesignImage!.image = null;
                                              });
                                            },
                                            child: Icon(Icons.close, size: 15, color: Colors.white)),
                                      )
                                    ]),
                                  ),
                                ),
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
                          itemCount: value.selectBackDesignClass!.length,
                          itemBuilder: (BuildContext context, int index) => backDesign(
                              value.selectBackDesignClass![index].attributes!.productName!,
                              value.selectBackDesignClass![index].attributes!.image!.data!.attributes!.formats!.large!
                                  .url),
                          staggeredTileBuilder: (index) {
                            return StaggeredTile.count(1, index.isEven ? 1.4 : 1.8);
                          }),
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
                    Navigator.pop(context);
                  }
                  if (val == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => select_sleeve_design(frontImage:widget.frontImage, backImage:backDesignImage!.image,frontType: widget.type,backType: backDesignImage!.type,)));
                  }
                },
                currentIndex: 0,
                items: [
                  BottomNavigationBarItem(title: Text(''), icon: Image.asset('assets/images/Previous.png')),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/Next1.png'),
                    title: Text(''),
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
