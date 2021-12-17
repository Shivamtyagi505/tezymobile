import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/blouse/Drawing_Pad.dart';
import 'package:quikieappps1/screens/hangings.dart';
import 'package:url_launcher/url_launcher.dart';
//salwar top
class bottomreview extends StatefulWidget {
  @override
  bottomreviewState createState() => bottomreviewState();
}

class bottomreviewState extends State<bottomreview> {
  int _index;

  Widget appBar() {
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
                Navigator.pop(context,true);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Customer Name",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
                  SizedBox(height: 4),
                  Row(children: [
                    Text("Mobile:",
                        style: TextStyle(
                            color: Color.fromRGBO(145, 144, 154, 10), fontSize: 12, fontWeight: FontWeight.w500)),
                    Text(" +91 99999 999999",
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                  ]),
                  SizedBox(height: 5),
                  Row(children: [
                    Text("Bill No:",
                        style: TextStyle(
                            color: Color.fromRGBO(145, 144, 154, 10), fontSize: 12, fontWeight: FontWeight.w500)),
                    Text("4232", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                  ]),
                  SizedBox(height: 5),
                  Row(children: [
                    Text("Date Of Delivery :",
                        style: TextStyle(
                            color: Color.fromRGBO(145, 144, 154, 10), fontSize: 12, fontWeight: FontWeight.w500)),
                    Text("05 May 2021",
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                  ]),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text("Order Type : ",
                          style: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 10), fontSize: 12, fontWeight: FontWeight.w400)),
                      Text("Salwar",
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
                decoration: new BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(244, 248, 252, 10))),
          ],
        ),
        /*Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Divider(thickness: 1.5,color: Color.fromRGBO(176,176,176,10),),
        ),*/
        Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(60, 60, 61, 10),
                border: Border.all(
                  color: Color.fromRGBO(176, 176, 176, 10),
                  width: 1,
                )),
            child: Column(children: [
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    categories("Order No : 01"),
                    categories("Order No : 02"),
                    categories("Order No : 03"),
                    categories("Order No : 04"),
                  ],
                ),
              ),
              SizedBox(
                height: 9,
              ),
            ])),
      ],
    );
  }

  openwhatsapp() async{
    var whatsapp ="+919560103030";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=Hey,This is your generated Bill";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("Hey,This is your generated Bill")}";
    if(Platform.isIOS){
      // for iOS phone only
      if( await canLaunch(whatappURL_ios)){
         await launch(whatappURL_ios, forceSafariVC: false);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));
      }
    }else{
      // android , web
      if( await canLaunch(whatsappURl_android)){
        await launch(whatsappURl_android);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));
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

  Widget categories(String text) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(48), border: Border.all(color: Colors.white)),
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: Color.fromRGBO(60, 60, 61, 10), fontWeight: FontWeight.w500),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF3F7FB),
      body: Container(
          child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          color: Color.fromRGBO(3, 43, 119, 10),
          child: appBar(),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Expanded(
                                  child: Stack(alignment: Alignment.bottomCenter, children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: darkGrey,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            topRight: Radius.circular(0),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.photo,
                                            size: 40,
                                            color: textColor,
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
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                child: Expanded(
                                  child: Stack(alignment: Alignment.bottomCenter, children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
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
                                        child: Center(
                                          child: Icon(
                                            Icons.photo,
                                            size: 40,
                                            color: textColor,
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
                                      child: Center(
                                        child: Icon(
                                          Icons.photo,
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
                                      child: Center(
                                        child: Icon(
                                          Icons.photo,
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
                  style:
                      TextStyle(color: Color.fromRGBO(151, 151, 151, 10), fontSize: 15, fontWeight: FontWeight.w400)),
              SizedBox(height: 7),
              Container(
                height: MediaQuery.of(context).size.height/1.3,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                width: MediaQuery.of(context).size.width - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MeasurementWidget(
                      text1: 'Full Length',
                      text2: '21.25',
                      text3: 'Shoulder',
                      text4: '13.50',
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: width/1.2,
                      lineThickness: 1.0,
                      dashLength: 2.0,
                      dashColor: Color.fromRGBO(196, 196, 196, 10),
                      dashRadius: 0.0,
                      dashGapLength: 3.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                     MeasurementWidget(
                      text1: 'Sleeves Length',
                      text2: '23.25',
                      text3: 'Sleeves Round',
                      text4: '13.50',
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: width/1.2,
                      lineThickness: 1.0,
                      dashLength: 2.0,
                      dashColor: Color.fromRGBO(196, 196, 196, 10),
                      dashRadius: 0.0,
                      dashGapLength: 3.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    MeasurementWidget(
                      text1: 'ArmRound Round',
                      text2: '23.25',
                      text3: 'Circle Down Loose',
                      text4: '13.50',
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: width/1.2,
                      lineThickness: 1.0,
                      dashLength: 2.0,
                      dashColor: Color.fromRGBO(196, 196, 196, 10),
                      dashRadius: 0.0,
                      dashGapLength: 3.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    MeasurementWidget(
                      text1: 'Upper Chest Round',
                      text2: '23.25',
                      text3: 'Lower Chest Round',
                      text4: '13.50',
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: width/1.2,
                      lineThickness: 1.0,
                      dashLength: 2.0,
                      dashColor: Color.fromRGBO(196, 196, 196, 10),
                      dashRadius: 0.0,
                      dashGapLength: 3.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    MeasurementWidget(
                      text1: 'Waist Round',
                      text2: '23.25',
                      text3: 'Hip',
                      text4: '13.50',
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: width/1.2,
                      lineThickness: 1.0,
                      dashLength: 2.0,
                      dashColor: Color.fromRGBO(196, 196, 196, 10),
                      dashRadius: 0.0,
                      dashGapLength: 3.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    MeasurementWidget(
                      text1: 'Waist Length',
                      text2: '25.25',
                      text3: 'Slit Length',
                      text4: '13.50',
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: width/1.2,
                      lineThickness: 1.0,
                      dashLength: 2.0,
                      dashColor: Color.fromRGBO(196, 196, 196, 10),
                      dashRadius: 0.0,
                      dashGapLength: 3.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    MeasurementWidget(
                      text1: 'Front Neck Deep',
                      text2: '26.25',
                      text3: 'Back Neck Deep',
                      text4: '13.50',
                    ),
                     DottedLine(
                      direction: Axis.horizontal,
                      lineLength: width/1.2,
                      lineThickness: 1.0,
                      dashLength: 2.0,
                      dashColor: Color.fromRGBO(196, 196, 196, 10),
                      dashRadius: 0.0,
                      dashGapLength: 3.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    MeasurementWidget(
                      text1: 'Neck Width',
                      text2: '26.25',
                      text3: 'Bust Point',
                      text4: '13.50',
                    ),
                     DottedLine(
                      direction: Axis.horizontal,
                      lineLength: width/1.2,
                      lineThickness: 1.0,
                      dashLength: 2.0,
                      dashColor: Color.fromRGBO(196, 196, 196, 10),
                      dashRadius: 0.0,
                      dashGapLength: 3.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    MeasurementWidget(
                      text1: 'Bottom Round',
                      text2: '26.25',
                      text3: '',
                      text4: '',
                    ),
                  ],

                ),
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
                  Column(
                      children: [Text('Lining'), Text('Yes', style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10)))]),
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
                  Column(
                      children: [Text('Cups'), Text('NO', style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10)))]),
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
                  Column(
                      children: [Text('PIPING'), Text('NO', style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10)))]),
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
                  Column(
                      children: [Text('ZIP'), Text('Front', style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10)))]),
               
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
                       Image.asset("assets/images/share.png"), SizedBox(width: 10,),
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
            ]))
      ]))),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   selectedItemColor: Color.fromRGBO(69, 89, 210, 10),
      //   unselectedItemColor: Colors.black54,
      //   onTap: (int val) {
      //     setState(() {
      //       _index = val;
      //     });

      //     if (val == 0) {
      //       // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: DailyLiaScreen()));
      //     }
      //     if (val == 1) {
      //       // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: MyHomePage()));
      //     }
      //     if (val == 1) {
      //       // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: MyHomePage()));
      //     }
      //   },
      //   currentIndex: 0,
      //   items: [
      //     BottomNavigationBarItem(
      //         title: Text(''),
      //         icon: Image.asset('assets/images/Group 1069.png')),
      //     BottomNavigationBarItem(
      //         title: Text(''),
      //         icon: Image.asset('assets/images/Group 1068.png')),

      //     BottomNavigationBarItem(
      //       icon: Image.asset('assets/images/Group 1067.png'),
      //       title: Text(''),
      //     ),

      //     //FloatingNavbarItem(icon: Icons.help_outline_rounded, title: 'Help Desk'),
      //   ],
      // ),
    );
  }
}

class MeasurementWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  const MeasurementWidget({
     this.text1,
     this.text2,
    this.text3,
     this.text4,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 150,
            child: Column(
              children: [
              Text(text1, style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10))),
              Text(text2, style: TextStyle(color: Color.fromRGBO(210, 85, 90, 10)))
            ]),
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
            width: 120,
            child: Column(children: [
              Text(text3, style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10))),
              Text(text4, style: TextStyle(color: Color.fromRGBO(210, 85, 90, 10)))
            ]),
          ),
        ],
      ),
    );
  }
}
