import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:quikieappps1/dress/design/select_sleeve_design.dart';
import 'package:quikieappps1/dress/dressreview.dart';
import 'package:quikieappps1/screens/placeOrder.dart';
import 'package:quikieappps1/dress/design/select_front_design.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:quikieappps1/assets/colors.dart';

class PreviewOrder extends StatefulWidget {
  @override
  _PreviewOrderState createState() => _PreviewOrderState();
}

class _PreviewOrderState extends State<PreviewOrder> {
  dynamic status = [true, true, true, true];

  Widget picWithHead(String head, String subHead) {
    return Flexible(
      child: Container(
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
            )
          ],
        ),
      ),
    );
  }

  Widget zipType() {
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
      initialLabelIndex: 1,
      totalSwitches: 3,
      labels: ['Back', 'Front', 'Side'],
      radiusStyle: true,
      onToggle: (index) {
        // print('switched to: $index');
      },
    );
  }

  Widget hooks() {
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
      initialLabelIndex: 1,
      totalSwitches: 2,
      labels: ['Back', 'Front'],
      radiusStyle: true,
      onToggle: (index) {
        // print('switched to: $index');
      },
    );
  }

  Widget toggle(String text, int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 15),
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
                status[i] = val;
              });
            },
            value: status[i],
          ),
        ],
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
              color: darkGrey,
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
                color: primaryColor,
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
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 5),
                  Text("+91 99999 999999",
                      style: TextStyle(
                          color: grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text("Order Type : ",
                          style: TextStyle(
                              color: grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      Text("Salwar",
                          style: TextStyle(
                              color: secondaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Divider(thickness: 1.5),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF3F7FB),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Text("Selected Images",
                      style: TextStyle(
                          color: grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                  child: Column(
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
                      SizedBox(height: 5),
                      Container(
                        height: 67,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            Expanded(child: SizedBox()),
                            Text(
                              "REVIEW MEASUREMENT",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 14, left: 27, right: 39),
                        child: Column(
                          children: [
                            toggle("PIPING", 0),
                            Divider(),
                            toggle("Back Zip", 1),
                            SizedBox(height: 10),

                            Divider(),
                            toggle("Lining", 2),
                            SizedBox(height: 10),

                            Divider(),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                picWithHead('HANGINGS',
                                    'Select or upload hanging or else leave blank'),
                                picWithHead('DRAWING PAD',
                                    'You can draw pattern or type any text here')
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                      )
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => select_sleeve_design()),
                  );
                },
                child: Image.asset("assets/images/Previous.png"),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => dressreview()),
                  );
                },
                child: Image.asset("assets/images/Group 416 (2).png"),
              )
            ],
          ),
        ));
  }
}
