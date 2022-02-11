import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:quikieappps1/assets/colors.dart';

class dressreview extends StatefulWidget {
  @override
  dressreviewState createState() => dressreviewState();
}

class dressreviewState extends State<dressreview> {
   int? _index;

  Widget appBar() {
    return Column(
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
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Customer Name",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400)),
                  SizedBox(height: 4),
                  Row(children: [
                    Text("Mobile:",
                        style: TextStyle(
                            color: Color.fromRGBO(145, 144, 154, 10),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    Text(" +91 99999 999999",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ]),
                  SizedBox(height: 5),
                  Row(children: [
                    Text("Bill No:",
                        style: TextStyle(
                            color: Color.fromRGBO(145, 144, 154, 10),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    Text("4232",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ]),
                  SizedBox(height: 5),
                  Row(children: [
                    Text("Date Of Delivery :",
                        style: TextStyle(
                            color: Color.fromRGBO(145, 144, 154, 10),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    Text("05 May 2021",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ]),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text("Order Type : ",
                          style: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 10),
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                      Text("Hand work Blouse",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 70),
                child: Container(
                    width: 82.0,
                    height: 82.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(244, 248, 252, 10)))),
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
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                subHead,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 8, fontWeight: FontWeight.w400, color: labelGrey),
              ),
            ),
            Container(
              height: 124,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(196, 196, 196, 1),
                  borderRadius: BorderRadius.circular(20)),
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
      children: [
        imageContainer(top, true),
        SizedBox(width: 5),
        imageContainer(top, false)
      ],
    );
  }

  Widget categories(String text) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(48),
            border: Border.all(color: Colors.white)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(60, 60, 61, 10),
              fontWeight: FontWeight.w500),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF3F7FB),
      body: Container(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Color.fromRGBO(3, 43, 119, 10),
                      child: appBar(),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  children: [
                                    selectedImage(true),
                                    SizedBox(height: 5),
                                    selectedImage(false)
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
                                  style: TextStyle(
                                      color: Color.fromRGBO(151, 151, 151, 10),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(height: 7),
                              Container(
                                height:470,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                width: MediaQuery.of(context).size.width - 10,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    MeasurementWidget(
                                      text1: 'Full Length',
                                      text2: '23.25',
                                      text3: 'Shoulder',
                                      text4: '13.50',
                                    ),
                                    SizedBox(
                                      height: 5.5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF3F7FB),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight: Radius.circular(20))),
                                        ),
                                        DottedLine(
                                          direction: Axis.horizontal,
                                          lineLength: width/1.2,
                                          lineThickness: 1.0,
                                          dashLength: 4.0,
                                          dashColor: Color.fromRGBO(196, 196, 196, 10),
                                          dashRadius: 0.0,
                                          dashGapLength: 4.0,
                                          dashGapColor: Colors.transparent,
                                          dashGapRadius: 0.0,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF3F7FB),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft: Radius.circular(20))),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6.5,
                                    ),
                                    MeasurementWidget(
                                      text1: 'Chest Round',
                                      text2: '23.25',
                                      text3: 'Waist Round',
                                      text4: '13.50',
                                    ),
                                    SizedBox(
                                      height: 5.5,
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
                                    SizedBox(
                                      height: 6.5,
                                    ),
                                    MeasurementWidget(
                                      text1: 'Waist band Length',
                                      text2: '23.25',
                                      text3: 'Sleeves Length',
                                      text4: '13.50',
                                    ),
                                    SizedBox(
                                      height: 5.5,
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
                                    SizedBox(
                                      height: 6.5,
                                    ),
                                    MeasurementWidget(
                                      text1: 'Sleeve Round',
                                      text2: '23.25',
                                      text3: 'Arm Hole Round',
                                      text4: '13.50',
                                    ),
                                    SizedBox(
                                      height: 5.5,
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
                                    SizedBox(
                                      height: 6.5,
                                    ),
                                    MeasurementWidget(
                                      text1: 'Front Neck Deep',
                                      text2: '23.25',
                                      text3: 'Back Neck Deep',
                                      text4: '13.50',
                                    ),
                                    SizedBox(
                                      height: 5.5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF3F7FB),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight: Radius.circular(20))),
                                        ),
                                        DottedLine(
                                          direction: Axis.horizontal,
                                          lineLength: width/1.2,
                                          lineThickness: 1.0,
                                          dashLength: 4.0,
                                          dashColor: Color.fromRGBO(196, 196, 196, 10),
                                          dashRadius: 0.0,
                                          dashGapLength: 4.0,
                                          dashGapColor: Colors.transparent,
                                          dashGapRadius: 0.0,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF3F7FB),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft: Radius.circular(20))),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6.5,
                                    ),
                                    MeasurementWidget(
                                      text1: 'Neck Width',
                                      text2: '23.25',
                                      text3: 'Bust Width',
                                      text4: '13.50',
                                    ),
                                    SizedBox(
                                      height: 5.5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 14,
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
                              SizedBox(
                                height: 19,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(children: [Text('PIPING'), Text('NO',style: TextStyle(color: Color.fromRGBO(3,43,119,10)))]),
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
                                  Column(children: [Text('ZIP'), Text('Front',style: TextStyle(color: Color.fromRGBO(3,43,119,10)))]),
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
                                  Column(children: [Text('HOOKS'), Text('No',style: TextStyle(color: Color.fromRGBO(3,43,119,10)))]),
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
                                  picWithHead('DRAWING PAD', '')
                                ],
                              ),
                            ]))
                  ]))),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromRGBO(69, 89, 210, 10),
        unselectedItemColor: Colors.black54,
        onTap: (int val) {
          setState(() {
            _index = val;
          });

          if (val == 0) {
            // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: DailyLiaScreen()));
          }
          if (val == 1) {
            // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: MyHomePage()));
          }
          if (val == 1) {
            // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: MyHomePage()));
          }
        },
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/images/Group 1069.png')),
          BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/images/Group 1068.png')),

          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Group 1067.png'),
            label: '',
          ),

          //FloatingNavbarItem(icon: Icons.help_outline_rounded, title: 'Help Desk'),
        ],
      ),
    );
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 150,
            child: Column(children: [Text(text1!,style: TextStyle(color: Color.fromRGBO(3,43,119,10)),), Text(text2!,style: TextStyle(color:Color.fromRGBO(210,85,90,10),))]),
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
            width: 150,
            child: Column(children: [Text(text3!,style: TextStyle(color: Color.fromRGBO(3,43,119,10))), Text(text4!,style: TextStyle(color: Color.fromRGBO(3,43,119,10)))]),
          ),
        ],
      ),
    );
  }
}
