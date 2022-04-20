import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:date_format/date_format.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/blouse/place_order/place_order_controller.dart';
import 'package:quikieappps1/blouse/review/blouse_review_controller.dart';
import 'package:quikieappps1/customer/select_customer/select_cutsomer_controller.dart';
import 'package:quikieappps1/customer/update_boutique/update_boutique_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class blousereview extends StatefulWidget {
  @override
  blousereviewState createState() => blousereviewState();
}

class blousereviewState extends State<blousereview> {
  int? _index;

  openwhatsapp() async {
    var whatsapp = "+919560103030";
    var whatsappURl_android = "whatsapp://send?phone=" + whatsapp + "&text=Hey,This is your generated Bill";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("Hey,This is your generated Bill")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }

  Widget picWithHead(String head, String subHead) {
    var width = MediaQuery.of(context).size.width;
    return Flexible(
      child: Container(
        width: width,
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
              decoration:
                  BoxDecoration(color: Color.fromRGBO(196, 196, 196, 1), borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'assets/images/Click Open Gallery.png',
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget imageContainer(bool top, bool left) {
    return Container(
      child: Expanded(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Color.fromRGBO(60, 60, 61, 10),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(top && left ? 20 : 0),
                bottomLeft: Radius.circular(!top && left ? 20 : 0),
                topRight: Radius.circular(top && !left ? 20 : 0),
                bottomRight: Radius.circular(!top && !left ? 20 : 0),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.camera_alt_outlined,
                size: 40,
                color: textColor,
              ),
            ),
          ),
          Container(
              height: 28,
              decoration: BoxDecoration(
                color: labelGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(!top && left ? 20 : 0),
                  bottomRight: Radius.circular(!top && !left ? 20 : 0),
                ),
              ),
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    "Front Neck Design",
                    style: TextStyle(color: textColor, fontSize: 12),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ))
        ]),
      ),
    );
  }

  Widget selectedImage(bool top) {
    return Row(
      children: [imageContainer(top, true), SizedBox(width: 5), imageContainer(top, false)],
    );
  }

  PageController controller = PageController(viewportFraction: 1, keepPage: true);
  var currentPageValue = 0.0;

  Widget categories(String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: 80,
          width: 120,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(48), border: Border.all(color: Colors.white)),
          child: Text(
            text,
            style: TextStyle(fontSize: 15, color: Color.fromRGBO(60, 60, 61, 10), fontWeight: FontWeight.w500),
          )),
    );
  }

  Widget appBar(SelectCustomerController selectCustomerController, PlaceOrderController placeOrderController,
      BlouseReviewController blouseReviewController, UpdateBoutiqueController updateBoutiqueController) {
    return Column(
      children: [
        SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
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
                  Text(selectCustomerController.allCustomerAttributes?.name ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
                  SizedBox(height: 4),
                  Row(children: [
                    Text("Mobile:",
                        style: TextStyle(
                            color: Color.fromRGBO(145, 144, 154, 10), fontSize: 12, fontWeight: FontWeight.w500)),
                    Text(selectCustomerController.allCustomerAttributes?.mobile ?? '',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                  ]),
                  SizedBox(height: 5),
                  Row(children: [
                    Text("Bill No:",
                        style: TextStyle(
                            color: Color.fromRGBO(145, 144, 154, 10), fontSize: 12, fontWeight: FontWeight.w500)),
                    Text("${placeOrderController.invoiceNumber!.data!.attributes!.nextInvoiceNumberSuggestion}",
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                  ]),
                  SizedBox(height: 5),
                  Row(children: [
                    Text("Date Of Delivery :",
                        style: TextStyle(
                            color: Color.fromRGBO(145, 144, 154, 10), fontSize: 12, fontWeight: FontWeight.w500)),
                    Text("${formatDate(placeOrderController.selectedValue, [dd, M, yyyy])}",
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                  ]),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text("Order Type : ",
                          style: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 10), fontSize: 12, fontWeight: FontWeight.w400)),
                      Text(placeOrderController.orderType,
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 82.0,
              height: 82.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromRGBO(3, 43, 119, 10),
                  ),
                  image: DecorationImage(
                      image: new NetworkImage(
                        'http://172.105.253.131:1337${updateBoutiqueController.profileImage!.data!.attributes!.boutiqueImage!.data!.attributes!.url!}',
                      ),
                      fit: BoxFit.cover)),
            )
          ],
        ),
        Container(
            height: 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Color.fromRGBO(60, 60, 61, 10),
                border: Border.all(
                  color: Color.fromRGBO(176, 176, 176, 10),
                  width: 1,
                )),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: placeOrderController.viewOrderAndMeasurement.length,
                itemBuilder: (BuildContext context, int index) {
                  return categories('Order No: ${index + 1}', () {
                    controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.bounceIn);
                  });
                }))
      ],
    );
  }

  @override
  void initState() {
    var provider = Provider.of<UpdateBoutiqueController>(context, listen: false);
    provider.fetchProfileImage();
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer4<SelectCustomerController, PlaceOrderController, BlouseReviewController, UpdateBoutiqueController>(
        builder:
            (context, selectCustomer, placeOrderController, blouseReviewController, updateBoutiqueController, child) {
      return updateBoutiqueController.profileImage == null
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Color(0xffF3F7FB),
              body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  color: Color.fromRGBO(3, 43, 119, 10),
                  child: appBar(selectCustomer, placeOrderController, blouseReviewController, updateBoutiqueController),
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    child: PageView.builder(
                        controller: controller,
                        itemCount: placeOrderController.viewOrderAndMeasurement.length,
                        itemBuilder: (BuildContext context, int index) {
                          return review(width, context, placeOrderController, index);
                        }),
                  ),
                ),
              ]),
            );
    });
  }

  Widget review(double width, BuildContext context, PlaceOrderController placeOrderController, int index) {
    var data = base64Decode(placeOrderController.viewOrderAndMeasurement[index].fabricImage);
    var frontImage;
    var backImage;
    var sleevesImage;
    if (placeOrderController.viewOrderAndMeasurement[index].frontImageType == 'Camera' ||
        placeOrderController.viewOrderAndMeasurement[index].frontImage == 'Gallery') {
      frontImage = base64Decode(placeOrderController.viewOrderAndMeasurement[index].frontImage);
    }
    if (placeOrderController.viewOrderAndMeasurement[index].backImageType == 'Camera' ||
        placeOrderController.viewOrderAndMeasurement[index].backImage == 'Gallery') {
      backImage = base64Decode(placeOrderController.viewOrderAndMeasurement[index].backImage);
    }
    if (placeOrderController.viewOrderAndMeasurement[index].sleevesImageType == 'Camera' ||
        placeOrderController.viewOrderAndMeasurement[index].sleevesImage == 'Gallery') {
      sleevesImage = base64Decode(placeOrderController.viewOrderAndMeasurement[index].sleevesImage);
    }
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
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
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                  ),
                                ),
                                child: placeOrderController.viewOrderAndMeasurement[index].fabricImage == null
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
                                    : ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                        ),
                                        child: Image.memory(
                                          data,
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                        ))),
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
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: placeOrderController.viewOrderAndMeasurement[index].frontImage == null
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
                                    : placeOrderController.viewOrderAndMeasurement[index].frontImage != null &&
                                                placeOrderController.viewOrderAndMeasurement[index].frontImageType ==
                                                    'Gallery' ||
                                            placeOrderController.viewOrderAndMeasurement[index].frontImageType ==
                                                'Camera'
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              bottomLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            child: Image.memory(
                                              frontImage,
                                              fit: BoxFit.fill,
                                              width: double.infinity,
                                            ))
                                        : ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              bottomLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            child: Image.network(
                                              'http://172.105.253.131:1337${placeOrderController.viewOrderAndMeasurement[index].frontImage}',
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
                                child: placeOrderController.viewOrderAndMeasurement[index].backImage == null
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
                                    : placeOrderController.viewOrderAndMeasurement[index].backImage == null &&
                                                placeOrderController.viewOrderAndMeasurement[index].backImageType ==
                                                    'Gallery' ||
                                            placeOrderController.viewOrderAndMeasurement[index].backImageType ==
                                                'Camera'
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              bottomLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            child: Image.memory(
                                              backImage,
                                              fit: BoxFit.fill,
                                              width: double.infinity,
                                            ))
                                        : ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              bottomLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            child: Image.network(
                                              'http://172.105.253.131:1337${placeOrderController.viewOrderAndMeasurement[index].backImage}',
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
                                child: placeOrderController.viewOrderAndMeasurement[index].sleevesImage == null
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
                                    : placeOrderController.viewOrderAndMeasurement[index].sleevesImage != null &&
                                                placeOrderController.viewOrderAndMeasurement[index].sleevesImageType ==
                                                    'Gallery' ||
                                            placeOrderController.viewOrderAndMeasurement[index].sleevesImageType ==
                                                'Camera'
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              bottomLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            child: Image.memory(
                                              sleevesImage,
                                              fit: BoxFit.fill,
                                              width: double.infinity,
                                            ))
                                        : ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              bottomLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            child: Image.network(
                                              'http://172.105.253.131:1337${placeOrderController.viewOrderAndMeasurement[index].sleevesImage}',
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
            DottedLine(
              direction: Axis.horizontal,
              lineLength: width / 1.2,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: Color.fromRGBO(196, 196, 196, 10),
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
            SizedBox(height: 7),
            Text("Customer Measurement",
                style: TextStyle(color: Color.fromRGBO(151, 151, 151, 10), fontSize: 15, fontWeight: FontWeight.w400)),
            SizedBox(height: 7),
            Container(
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                width: MediaQuery.of(context).size.width - 10,
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: placeOrderController.viewOrderAndMeasurement[index].data!.length,
                    itemBuilder: (BuildContext context, int i) {
                      String key = placeOrderController.viewOrderAndMeasurement[index].data!.keys.elementAt(i);
                      double values = placeOrderController.viewOrderAndMeasurement[index].data!.values.elementAt(i);
                      return Column(children: [
                        MeasurementWidget(
                          text1: '$key',
                          text2: '$values',
                        ),
                      ]);
                    })
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     MeasurementWidget(
                //       text1: 'Full Length',
                //       text2: '23.25',
                //       text3: 'Shoulder',
                //       text4: '13.50',
                //     ),
                //     DottedLine(
                //       direction: Axis.horizontal,
                //       lineLength: width / 1.2,
                //       lineThickness: 1.0,
                //       dashLength: 2.0,
                //       dashColor: Color.fromRGBO(196, 196, 196, 10),
                //       dashRadius: 0.0,
                //       dashGapLength: 3.0,
                //       dashGapColor: Colors.transparent,
                //       dashGapRadius: 0.0,
                //     ),
                //     MeasurementWidget(
                //       text1: 'Shoulder Gap',
                //       text2: '23.25',
                //       text3: 'Sleeves Length',
                //       text4: '13.50',
                //     ),
                //     DottedLine(
                //       direction: Axis.horizontal,
                //       lineLength: width / 1.2,
                //       lineThickness: 1.0,
                //       dashLength: 2.0,
                //       dashColor: Color.fromRGBO(196, 196, 196, 10),
                //       dashRadius: 0.0,
                //       dashGapLength: 3.0,
                //       dashGapColor: Colors.transparent,
                //       dashGapRadius: 0.0,
                //     ),
                //     MeasurementWidget(
                //       text1: 'ArmRound Round',
                //       text2: '23.25',
                //       text3: 'Circle Down Loose',
                //       text4: '13.50',
                //     ),
                //     DottedLine(
                //       direction: Axis.horizontal,
                //       lineLength: width / 1.2,
                //       lineThickness: 1.0,
                //       dashLength: 2.0,
                //       dashColor: Color.fromRGBO(196, 196, 196, 10),
                //       dashRadius: 0.0,
                //       dashGapLength: 3.0,
                //       dashGapColor: Colors.transparent,
                //       dashGapRadius: 0.0,
                //     ),
                //     MeasurementWidget(
                //       text1: 'Sleeves Round',
                //       text2: '23.25',
                //       text3: 'Upper Chest Round',
                //       text4: '13.50',
                //     ),
                //     DottedLine(
                //       direction: Axis.horizontal,
                //       lineLength: width / 1.2,
                //       lineThickness: 1.0,
                //       dashLength: 2.0,
                //       dashColor: Color.fromRGBO(196, 196, 196, 10),
                //       dashRadius: 0.0,
                //       dashGapLength: 3.0,
                //       dashGapColor: Colors.transparent,
                //       dashGapRadius: 0.0,
                //     ),
                //     MeasurementWidget(
                //       text1: 'Chest Round',
                //       text2: '23.25',
                //       text3: 'Lower Chest Round',
                //       text4: '13.50',
                //     ),
                //     DottedLine(
                //       direction: Axis.horizontal,
                //       lineLength: width / 1.2,
                //       lineThickness: 1.0,
                //       dashLength: 2.0,
                //       dashColor: Color.fromRGBO(196, 196, 196, 10),
                //       dashRadius: 0.0,
                //       dashGapLength: 3.0,
                //       dashGapColor: Colors.transparent,
                //       dashGapRadius: 0.0,
                //     ),
                //     MeasurementWidget(
                //       text1: 'Waist Round',
                //       text2: '23.25',
                //       text3: 'First Dart Point',
                //       text4: '13.50',
                //     ),
                //     DottedLine(
                //       direction: Axis.horizontal,
                //       lineLength: width / 1.2,
                //       lineThickness: 1.0,
                //       dashLength: 2.0,
                //       dashColor: Color.fromRGBO(196, 196, 196, 10),
                //       dashRadius: 0.0,
                //       dashGapLength: 3.0,
                //       dashGapColor: Colors.transparent,
                //       dashGapRadius: 0.0,
                //     ),
                //     MeasurementWidget(
                //       text1: 'Second Dart Point',
                //       text2: '23.25',
                //       text3: 'Bust Point',
                //       text4: '13.50',
                //     ),
                //     DottedLine(
                //       direction: Axis.horizontal,
                //       lineLength: width / 1.2,
                //       lineThickness: 1.0,
                //       dashLength: 2.0,
                //       dashColor: Color.fromRGBO(196, 196, 196, 10),
                //       dashRadius: 0.0,
                //       dashGapLength: 3.0,
                //       dashGapColor: Colors.transparent,
                //       dashGapRadius: 0.0,
                //     ),
                //     MeasurementWidget(
                //       text1: 'Front AC',
                //       text2: '23.25',
                //       text3: 'Front Neck Deep',
                //       text4: '13.50',
                //     ),
                //     DottedLine(
                //       direction: Axis.horizontal,
                //       lineLength: width / 1.2,
                //       lineThickness: 1.0,
                //       dashLength: 2.0,
                //       dashColor: Color.fromRGBO(196, 196, 196, 10),
                //       dashRadius: 0.0,
                //       dashGapLength: 3.0,
                //       dashGapColor: Colors.transparent,
                //       dashGapRadius: 0.0,
                //     ),
                //     MeasurementWidget(
                //       text1: 'Back Neck Deep',
                //       text2: '23.25',
                //       text3: 'Waist Band Length',
                //       text4: '13.50',
                //     ),
                //     DottedLine(
                //       direction: Axis.horizontal,
                //       lineLength: width / 1.2,
                //       lineThickness: 1.0,
                //       dashLength: 2.0,
                //       dashColor: Color.fromRGBO(196, 196, 196, 10),
                //       dashRadius: 0.0,
                //       dashGapLength: 3.0,
                //       dashGapColor: Colors.transparent,
                //       dashGapRadius: 0.0,
                //     ),
                //     MeasurementWidget(
                //       text1: 'Neck Width',
                //       text2: '23.25',
                //       text3: 'Back Neck broad',
                //       text4: '13.50',
                //     ),
                //   ],
                // ),
                ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DottedLine(
                direction: Axis.horizontal,
                lineLength: width,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Color.fromRGBO(196, 196, 196, 10),
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  Text('Cups'),
                  Text('${placeOrderController.viewOrderAndMeasurement[index].cupsValue}',
                      style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10)))
                ]),
                DottedLine(
                  direction: Axis.vertical,
                  lineLength: 52,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Color.fromRGBO(196, 196, 196, 10),
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                Column(children: [
                  Text('PIPING'),
                  Text('${placeOrderController.viewOrderAndMeasurement[index].pipingValue}',
                      style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10)))
                ]),
                DottedLine(
                  direction: Axis.vertical,
                  lineLength: 52,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Color.fromRGBO(196, 196, 196, 10),
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                Column(children: [
                  Text('ZIP'),
                  Text('${placeOrderController.viewOrderAndMeasurement[index].zipType}',
                      style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10)))
                ]),
                DottedLine(
                  direction: Axis.vertical,
                  lineLength: 52,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Color.fromRGBO(196, 196, 196, 10),
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                Column(children: [
                  Text('Hooks'),
                  Text('${placeOrderController.viewOrderAndMeasurement[index].hooks}',
                      style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10)))
                ]),
              ],
            ),
            SizedBox(
              height: 19,
            ),
            DottedLine(
              direction: Axis.horizontal,
              lineLength: width,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: Color.fromRGBO(196, 196, 196, 10),
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                picWithHead('HANGINGS', ''),
                picWithHead('DRAWING PAD', ''),
              ],
            ),
            SizedBox(height: 8),
            GestureDetector(
                onTap: () {
                  openwhatsapp();
                },
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 60),
                    height: 42,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Color(0xff1170DE), borderRadius: BorderRadius.circular(21)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset("assets/images/share.png"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Whatsapp this Receipt',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ]))),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/Group 1069.png'),
                  Image.asset('assets/images/Group 1068.png'),
                  Image.asset('assets/images/Group 1067.png'),
                ],
              ),
            )
          ]),
        ));
  }
}

class MeasurementWidget extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  const MeasurementWidget({
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              width: 150,
              child: Text(text1!, style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10))),
            ),
            Center(
              child: DottedLine(
                direction: Axis.vertical,
                lineLength: 52.5,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Color.fromRGBO(196, 196, 196, 10),
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              child: Text(text2!, style: TextStyle(color: Color.fromRGBO(210, 85, 90, 10))),
            ),
          ],
        ),
        DottedLine(
          direction: Axis.horizontal,
          lineLength: MediaQuery.of(context).size.width / 1.2,
          lineThickness: 1.0,
          dashLength: 2.0,
          dashColor: Color.fromRGBO(196, 196, 196, 10),
          dashRadius: 0.0,
          dashGapLength: 3.0,
          dashGapColor: Colors.transparent,
          dashGapRadius: 0.0,
        ),
      ],
    );
  }
}
