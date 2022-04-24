import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:quikieappps1/assets/colors.dart';

import 'package:quikieappps1/blouse/design/after_selection.dart';
import 'package:quikieappps1/blouse/design/select_design/select_design_controller.dart';
import 'package:quikieappps1/blouse/preview_order/previewOrder_blouse.dart';
import 'package:quikieappps1/home/home_page/homepage_controller.dart';

class select_sleeve_design extends StatefulWidget {
  var frontImage;
  var backImage;
  String? frontType;
  String? backType;
  select_sleeve_design({this.frontImage, this.backImage, this.frontType, this.backType});
  @override
  select_sleeve_designState createState() => select_sleeve_designState();
}

class select_sleeve_designState extends State<select_sleeve_design> {
  int? _index;

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Consumer<BlouseSelectDesignController>(builder: (context, value, child) {
            return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.photo_library),
                        title: new Text('Photo Library'),
                        onTap: () {
                          value.imgFromGallerySleeves(bc);
                          Navigator.of(context).pop();
                        }),
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('Camera'),
                      onTap: () {
                        value.imgFromCameraSleeves(bc);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
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

  Widget frontImageContainer(String text) {
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
                  (widget.frontImage != null && widget.frontType == 'Gallery' || widget.frontType == 'Camera')
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

  Widget backImageContainer(String text) {
    return widget.backImage == null
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
                  (widget.backImage != null && widget.backType == 'Gallery' || widget.backType == 'Camera')
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          height: 180,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(180, 180, 180, 1), borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                widget.backImage,
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
                                'http://172.105.253.131:1337${widget.backImage}',
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
                          widget.backImage = null;
                        });
                      },
                      child: Icon(Icons.close, size: 15, color: Colors.white)),
                )
              ]),
            ),
          );
  }

  Widget sleevesDesign(String text, var image, BlouseSelectDesignController value) {
    return InkWell(
      onDoubleTap: () {
        setState(() {
          value.sleeveDesignImage!.image = image;
          value.sleeveDesignImage!.type = 'Categorie';
          value.sleevesImageUrl = image;
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
            value.sleeveDesignImage!.image = data;
            value.sleeveDesignImage!.type = 'Categorie';
            value.sleevesImageUrl = image;
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
    var homePage = Provider.of<HomepageController>(context, listen: false);
    provider.fetchSelectSleeveDesignApi(homePage.productName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BlouseSelectDesignController>(builder: (context, value, child) {
      return value.selectSleeveDesign == null
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
                                    Text("Select Sleeves Design",
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
                          frontImageContainer("Front Design"),
                          backImageContainer("Back Design"),
                          value.sleeveDesignImage!.image == null
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
                                                  'Sleeve Design',
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
                                        (value.sleeveDesignImage!.image != null &&
                                                    value.sleeveDesignImage!.type == 'Gallery' ||
                                                value.sleeveDesignImage!.type == 'Camera')
                                            ? Container(
                                                margin: EdgeInsets.symmetric(horizontal: 3),
                                                height: 180,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(180, 180, 180, 1),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8),
                                                    child: Image.file(
                                                      value.sleeveDesignImage!.image,
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
                                                      'http://172.105.253.131:1337${value.sleeveDesignImage!.image}',
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
                                                  'Sleeve Design',
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
                                                value.sleeveDesignImage!.image = null;
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
                    (value.selectSleeveDesignClass!.isNotEmpty)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: StaggeredGridView.countBuilder(
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 12,
                                itemCount: value.selectSleeveDesignClass!.length,
                                itemBuilder: (BuildContext context, int index) => sleevesDesign(
                                    value.selectSleeveDesignClass![index].attributes!.productName!,
                                    value.selectSleeveDesignClass![index].attributes!.image!.data!.attributes!.formats!
                                        .large!.url,
                                    value),
                                staggeredTileBuilder: (index) {
                                  return StaggeredTile.count(1, index.isEven ? 1.4 : 1.8);
                                }),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 130),
                            child: Text(
                              'Oops!! No Sleeves Design. Please Upload Your Photo!',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            )),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Color.fromRGBO(69, 89, 210, 10),
                unselectedItemColor: Colors.black54,
                onTap: (int val) async {
                  setState(() {
                    _index = val;
                  });

                  if (val == 0) {
                    Navigator.pop(context);
                  }
                  if (val == 1) {
                    if (widget.frontImage == null &&
                        widget.backImage == null &&
                        value.sleeveDesignImage!.image == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      height: 100,
                                      child: Text('Select Any \n One Designs !!',
                                          style: TextStyle(color: Colors.red, fontSize: 16),
                                          textAlign: TextAlign.center)),
                                  Positioned(
                                      left: 240,
                                      top: 10,
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            ),
                            // content: Text('Select Any Front Design!!',style: TextStyle(color: Colors.red),),
                          );
                        },
                      );
                    } else {
                      // value.updateValue();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewOrdersBlouse(
                                  frontImage: widget.frontImage,
                                  backImage: widget.backImage,
                                  sleeveImage: value.sleeveDesignImage!.image,
                                  frontType: widget.frontType,
                                  backType: widget.backType,
                                  sleeveType: value.sleeveDesignImage!.type,
                                )),
                      );
                    }
                    if (value.sleeveDesignImage!.image != null) {
                      value.saveImage('sleevesImage', value.sleeveDesignImage!);
                    }
                  }
                },
                currentIndex: 0,
                items: [
                  BottomNavigationBarItem(label: '', icon: Image.asset('assets/images/Previous.png')),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/Next1.png'),
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
