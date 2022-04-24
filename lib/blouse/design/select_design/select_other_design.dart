import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/blouse/design/select_design/select_design_controller.dart';
import 'package:quikieappps1/blouse/preview_order/previewOrder_blouse.dart';
import 'package:quikieappps1/hangings/hangings_controller.dart';
import 'package:quikieappps1/home/home_page/homepage_controller.dart';

class SelectBottomOtherDesign extends StatefulWidget {
  @override
  SelectBottomOtherDesignState createState() => SelectBottomOtherDesignState();
}

class SelectBottomOtherDesignState extends State<SelectBottomOtherDesign> {
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
                          value.imgFromGalleryBottom(bc);
                          Navigator.of(context).pop();
                        }),
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('Camera'),
                      onTap: () {
                        value.imgFromCameraBottom(bc);
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

  Widget hangingDesign(String text, var image, BlouseSelectDesignController value) {
    return InkWell(
      onDoubleTap: () {
        setState(() {
          value.bottomDesignImage!.image = image;
          value.bottomDesignImage!.type = 'Categorie';
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
    var provider = Provider.of<BlouseSelectDesignController>(context, listen: false);
    var homePage = Provider.of<HomepageController>(context, listen: false);
    homePage.categoriesName();
    provider.fetchSelectBottomDesignApi(homePage.productName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BlouseSelectDesignController>(builder: (context, value, child) {
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
                          Text("Select Design",
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
          value.bottomDesignImage!.image == null
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
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(alignment: Alignment.topRight, children: [
                    Stack(alignment: Alignment.bottomCenter, children: [
                      (value.bottomDesignImage!.image != null && value.bottomDesignImage!.type == 'Gallery' ||
                              value.bottomDesignImage!.type == 'Camera')
                          ? Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              height: 180,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(180, 180, 180, 1), borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    value.bottomDesignImage!.image,
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
                                    'http://172.105.253.131:1337${value.bottomDesignImage!.image}',
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
                          onTap: () {
                            setState(() {
                              value.bottomDesignImage!.image = null;
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
                  itemCount: value.selectBottomOtherClass!.length,
                  itemBuilder: (BuildContext context, int index) => hangingDesign(
                      value.selectBottomOtherClass![index].attributes!.productName!,
                      value.selectBottomOtherClass![index].attributes!.image!.data!.attributes!.formats!.small!.url,
                      value),
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
          onTap: (int val) async {
            setState(() {
              // _index = val;
            });

            if (val == 0) {
              Navigator.pop(context);
            }
            if (val == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PreviewOrdersBlouse(
                          bottomImage: value.bottomDesignImage!.image,
                          bottomType: value.bottomDesignImage!.type,
                        )),
              );
            }
            // if (value.frontDesignImage!.image != null) {
            //   value.saveImage('frontImage', value.frontDesignImage!);
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
