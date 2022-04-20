import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/blouse/Drawing_Pad.dart';
import 'package:quikieappps1/blouse/preview_order/previewOrder_blouse_controller.dart';
import 'package:quikieappps1/blouse/place_order/placeOrder.dart';
import 'package:quikieappps1/customer/select_customer/select_cutsomer_controller.dart';
import 'package:quikieappps1/hangings/hangings.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:quikieappps1/assets/colors.dart';

class PreviewOrdersBlouse extends StatefulWidget {
  var frontImage;
  var backImage;
  var sleeveImage;
  String? frontType;
  String? backType;
  String? sleeveType;
  PreviewOrdersBlouse(
      {this.frontImage, this.backImage, this.sleeveImage, this.frontType, this.backType, this.sleeveType});
  @override
  _PreviewOrdersBlouseState createState() => _PreviewOrdersBlouseState();
}

class _PreviewOrdersBlouseState extends State<PreviewOrdersBlouse> {
  void _showCameraPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Consumer<PreviewOrderBlouseController>(builder: (context, value, child) {
            return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('Camera'),
                      onTap: () {
                        value.imgFromCameraFabric();
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

  Widget picWithHead(String head, String subHead) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            head,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              subHead,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: labelGrey),
            ),
          ),
          Container(
            height: 124,
            decoration: BoxDecoration(color: Color.fromRGBO(196, 196, 196, 1), borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              'assets/images/Click Open Gallery.png',
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }

  Widget zipType(PreviewOrderBlouseController value) {
    return ToggleSwitch(
      minWidth: 90.0,
      cornerRadius: 20.0,
      activeBgColors: [
        [Colors.white],
        [Colors.white],
        [Colors.white]
      ],
      activeFgColor: secondaryColor,
      inactiveBgColor: secondaryColor,
      inactiveFgColor: Colors.white,
      initialLabelIndex: value.zipTypeLabel,
      totalSwitches: 3,
      labels: ['Back', 'Front', 'Side'],
      radiusStyle: true,
      onToggle: (index) {
        value.savePreviewOrderString('zipType', index!);
        value.zipTypeIndex = true;
      },
    );
  }

  Widget hooks(PreviewOrderBlouseController value) {
    return ToggleSwitch(
      minWidth: 120.0,
      cornerRadius: 20.0,
      activeBgColors: [
        [Colors.white],
        [Colors.white]
      ],
      activeFgColor: secondaryColor,
      inactiveBgColor: secondaryColor,
      inactiveFgColor: background,
      initialLabelIndex: value.hooksLabel,
      totalSwitches: 2,
      labels: ['Back', 'Front'],
      radiusStyle: true,
      onToggle: (index) {
        value.savePreviewOrderString('hooks', index!);
        value.hooksIndex = true;
      },
    );
  }

  Widget toggle(String text, int i, PreviewOrderBlouseController value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w600, fontSize: 15),
          ),
          FlutterSwitch(
            activeColor: secondaryColor,
            inactiveColor: labelGrey,
            width: 47.0,
            height: 25.0,
            toggleSize: 17.0,
            borderRadius: 33.0,
            onToggle: (val) {
              setState(() {
                value.status[i] = val;
              });
            },
            value: value.status[i],
          ),
        ],
      ),
    );
  }

  Widget appBar(PreviewOrderBlouseController controller) {
    return Consumer<SelectCustomerController>(builder: (context, value, child) {
      //print('name value is  ${value.addCustomerModel?.data?.attributes.name}');
      //return value.allCustomerModel!.data!.attributes!.name != null ?
      return value.allCustomerAttributes != null
          ? Column(
              children: [
                SizedBox(height: 35),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${value.allCustomerAttributes!.name}",
                              style: TextStyle(color: primaryColor, fontSize: 25, fontWeight: FontWeight.w500)),
                          SizedBox(height: 5),
                          Text("${value.allCustomerAttributes!.mobile}",
                              style: TextStyle(color: grey, fontSize: 12, fontWeight: FontWeight.w500)),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("Order Type : ",
                                  style: TextStyle(color: grey, fontSize: 15, fontWeight: FontWeight.w500)),
                              Text(controller.orderType,
                                  style: TextStyle(color: secondaryColor, fontSize: 15, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // }
                    // ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Divider(thickness: 1.5),
                ),
              ],
            )
          : Column(
              children: [
                SizedBox(height: 35),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Consumer<SelectCustomerController>(builder: (context, value, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("",
                                  style: TextStyle(color: primaryColor, fontSize: 25, fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              Text("", style: TextStyle(color: grey, fontSize: 12, fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text("Order Type : ",
                                      style: TextStyle(color: grey, fontSize: 15, fontWeight: FontWeight.w500)),
                                  Text(controller.orderType,
                                      style:
                                          TextStyle(color: secondaryColor, fontSize: 15, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          );
                        })),
                    // }
                    // ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Divider(thickness: 1.5),
                ),
              ],
            );
    });
  }

  @override
  void initState() {
    var provider = Provider.of<PreviewOrderBlouseController>(context, listen: false);
    provider.getOrderType(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreviewOrderBlouseController>(builder: (context, value, child) {
      return Scaffold(
          backgroundColor: Color(0xffF3F7FB),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appBar(value),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Text("Selected Images",
                        style: TextStyle(color: grey, fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  fabricWidget(value),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Expanded(
                                      child: Stack(alignment: Alignment.bottomCenter, children: [
                                        Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: darkGrey,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(0),
                                                bottomLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: widget.frontImage == null
                                                ? ClipRRect(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(0),
                                                      bottomLeft: Radius.circular(20),
                                                      topRight: Radius.circular(20),
                                                      bottomRight: Radius.circular(20),
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.photo,
                                                        size: 40,
                                                        color: textColor,
                                                      ),
                                                    ),
                                                  )
                                                : widget.frontImage != null && widget.frontType == 'Gallery' ||
                                                        widget.frontType == 'Camera'
                                                    ? ClipRRect(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(0),
                                                          bottomLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20),
                                                          bottomRight: Radius.circular(20),
                                                        ),
                                                        child: Image.file(
                                                          widget.frontImage,
                                                          fit: BoxFit.fill,
                                                        ))
                                                    : ClipRRect(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(0),
                                                          bottomLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20),
                                                          bottomRight: Radius.circular(20),
                                                        ),
                                                        child: Image.network(
                                                          'http://172.105.253.131:1337${widget.frontImage}',
                                                          width: double.infinity,
                                                          height: 100,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      )),
                                        Container(
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: labelGrey,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(child: SizedBox()),
                                                Text(
                                                  'Front Neck Design',
                                                  style: TextStyle(color: textColor, fontSize: 12),
                                                ),
                                                Expanded(child: SizedBox()),
                                              ],
                                            ))
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    child: Expanded(
                                      child: Stack(alignment: Alignment.bottomCenter, children: [
                                        Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: darkGrey,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(0),
                                                bottomLeft: Radius.circular(20),
                                                topRight: Radius.circular(0),
                                                bottomRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: widget.backImage == null
                                                ? ClipRRect(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(0),
                                                      bottomLeft: Radius.circular(20),
                                                      topRight: Radius.circular(20),
                                                      bottomRight: Radius.circular(20),
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.photo,
                                                        size: 40,
                                                        color: textColor,
                                                      ),
                                                    ),
                                                  )
                                                : widget.backImage != null && widget.backType == 'Gallery' ||
                                                        widget.backType == 'Camera'
                                                    ? ClipRRect(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(0),
                                                          bottomLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20),
                                                          bottomRight: Radius.circular(20),
                                                        ),
                                                        child: Image.file(
                                                          widget.backImage,
                                                          fit: BoxFit.fill,
                                                        ))
                                                    : ClipRRect(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(0),
                                                          bottomLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20),
                                                          bottomRight: Radius.circular(20),
                                                        ),
                                                        child: Image.network(
                                                          'http://172.105.253.131:1337${widget.backImage}',
                                                          width: double.infinity,
                                                          height: 100,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      )),
                                        Container(
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: labelGrey,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(0),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(child: SizedBox()),
                                                Text(
                                                  'Back Neck Design',
                                                  style: TextStyle(color: textColor, fontSize: 12),
                                                ),
                                                Expanded(child: SizedBox()),
                                              ],
                                            ))
                                      ]),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Expanded(
                                      child: Stack(alignment: Alignment.bottomCenter, children: [
                                        Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: darkGrey,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(0),
                                                bottomLeft: Radius.circular(20),
                                                topRight: Radius.circular(0),
                                                bottomRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: widget.sleeveImage == null
                                                ? ClipRRect(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(0),
                                                      bottomLeft: Radius.circular(20),
                                                      topRight: Radius.circular(20),
                                                      bottomRight: Radius.circular(20),
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.photo,
                                                        size: 40,
                                                        color: textColor,
                                                      ),
                                                    ),
                                                  )
                                                : widget.sleeveImage != null && widget.sleeveType == 'Gallery' ||
                                                        widget.sleeveType == 'Camera'
                                                    ? ClipRRect(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(0),
                                                          bottomLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20),
                                                          bottomRight: Radius.circular(20),
                                                        ),
                                                        child: Image.file(
                                                          widget.sleeveImage,
                                                          fit: BoxFit.fill,
                                                        ))
                                                    : ClipRRect(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(0),
                                                          bottomLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20),
                                                          bottomRight: Radius.circular(20),
                                                        ),
                                                        child: Image.network(
                                                          'http://172.105.253.131:1337${widget.sleeveImage}',
                                                          width: double.infinity,
                                                          height: 100,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      )),
                                        Container(
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: labelGrey,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(child: SizedBox()),
                                                Text(
                                                  'Sleeves Design',
                                                  style: TextStyle(color: textColor, fontSize: 12),
                                                ),
                                                Expanded(child: SizedBox()),
                                              ],
                                            ))
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 67,
                            decoration:
                                BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: [
                                Expanded(child: SizedBox()),
                                Text(
                                  "REVIEW MEASUREMENT",
                                  style: TextStyle(color: textColor, fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14, left: 27, right: 39),
                          child: Column(
                            children: [
                              toggle("CUPS", 0, value),
                              Divider(),
                              toggle("PIPING", 1, value),
                              Divider(),
                              toggle("ZIP TYPE", 2, value),
                              SizedBox(height: 10),
                              if (value.status[2]) zipType(value),
                              SizedBox(height: 5),
                              Divider(),
                              toggle("HOOKS", 3, value),
                              SizedBox(height: 10),
                              if (value.status[3]) hooks(value),
                              SizedBox(height: 5),
                              Divider(),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Hangings()),
                                  );
                                },
                                child: picWithHead('HANGINGS', '')),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Drawing_Pad()),
                                  );
                                },
                                child: picWithHead('DRAWING PAD', '')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                    if (value.image != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlaceOrder(
                                  fabricImage: value.image,
                                )),
                      );
                      value.saveSleevesImage('fabricImage', value.image!);
                      value.savePreviewOrder('cups', value.status[0]);
                      value.savePreviewOrder('piping', value.status[1]);
                      if (value.zipTypeIndex == false) value.savePreviewOrderString('zipType', 1);
                      if (value.hooksIndex == false) value.savePreviewOrderString('hooks', 1);
                    } else {
                      setState(() {
                        value.isFabric = true;
                      });
                    }
                  },
                  child: Image.asset("assets/images/Group 416 (2).png"),
                )
              ],
            ),
          ));
    });
  }

  Container fabricWidget(PreviewOrderBlouseController value) {
    return value.isFabric == false
        ? Container(
            child: Expanded(
              child: Stack(alignment: Alignment.bottomCenter, children: [
                InkWell(
                  onTap: () {
                    value.imgFromCameraFabric();
                  },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: value.image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(0),
                              bottomRight: Radius.circular(20),
                            ),
                            child: Image.file(
                              value.image!,
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 40),
                                    child: Text(
                                      'Take Customer Fabric Photo',
                                      textAlign: TextAlign.center,
                                    ))
                              ],
                            ),
                          ),
                  ),
                ),
                Container(
                    height: 28,
                    decoration: BoxDecoration(
                      color: labelGrey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Text(
                          'Customer Fabric',
                          style: TextStyle(color: textColor, fontSize: 12),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ))
              ]),
            ),
          )
        : Container(
            child: Expanded(
              child: Stack(alignment: Alignment.bottomCenter, children: [
                InkWell(
                  onTap: () {
                    value.imgFromCameraFabric();
                  },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: value.image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              value.image!,
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  size: 40,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 40),
                                    child: Text(
                                      'Take Customer Fabric Photo',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red),
                                    ))
                              ],
                            ),
                          ),
                  ),
                ),
                Container(
                    height: 28,
                    decoration: BoxDecoration(
                      color: labelGrey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Text(
                          'Customer Fabric',
                          style: TextStyle(color: textColor, fontSize: 12),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ))
              ]),
            ),
          );
  }
}
