

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/bottomdesign/bill/generatedbill.dart';
import 'package:quikieappps1/bottomdesign/preview_order/previewOrder_bottom.dart';

import 'package:quikieappps1/home/popularmenu.dart';

class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  bool container = false;
  int newContainer = 0;
  var nameController = TextEditingController();
  //DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();
  int _counter = 0;
  String dropdownValue = 'Jan';
  int selectedDate = 1;
  Widget buildImage() {
    final image = Image.asset('assets/images/Butique Profile.png');

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: image,
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 1,
        child: buildCircle(
          color: color,
          all: 1,
          child: Image.asset('assets/images/Edit Profile.png'),
        ),
      );

  Widget buildCircle({
    Widget child,
    double all,
    Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  showModel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Tabview(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget appBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Center(
                    child: Stack(
                      children: [
                        buildImage(),
                        Positioned(
                          bottom: 0,
                          right: 4,
                          child: buildEditIcon(Colors.white),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(height: 5),
                  Text("BOUTIQUE NAME",
                      style: TextStyle(color: primaryColor, fontSize: 25, fontWeight: FontWeight.w600)),
                  SizedBox(height: 5),
                  Text("Basaveshwarangar,Bangalore",
                      style: TextStyle(color: grey, fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(height: 2),
                  Text("E-Mail : boutiname@gmail.com",
                      style: TextStyle(color: grey, fontSize: 15, fontWeight: FontWeight.w500)),
                  SizedBox(height: 5),
                  Text("Mobile No : +91 99999 99999",
                      style: TextStyle(color: grey, fontSize: 15, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(thickness: 1.5),
        ),
      ],
    );
  }

  Widget date(String day, int date, bool select) {
    return Container(
        decoration:
            BoxDecoration(color: select ? Colors.white : secondaryColor, borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              day,
              style: select
                  ? TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)
                  : TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              date.toString(),
              style: select
                  ? TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500)
                  : TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF3F7FB),
        body: Stack(alignment: Alignment.topLeft, children: [
          Container(
              child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(child: appBar()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text("Customer Details", style: TextStyle(color: grey, fontSize: 15, fontWeight: FontWeight.w400)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 11, vertical: 8),
              height: 75,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CUSTOMER NAME",
                            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600)),
                        Divider(
                          color: Colors.black,
                          thickness: 0.5,
                        ),
                        Text("Mobile No:  +91 99999 99999",
                            style: TextStyle(
                                color: Color.fromRGBO(102, 102, 102, 1), fontSize: 13, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  SizedBox(width: 14),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      "assets/images/Edit Button.png",
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(thickness: 1.5),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: [
                Text(
                  "Invoice No : ",
                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Flexible(
                  child: Container(
                    width: 200,
                    child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'Enter Invoice Number')),
                  ),
                ),
              ]),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 9,
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Date :",
                      style: TextStyle(color: grey, fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Color(0xff8E8D8D)),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        'Jan',
                        'Feb',
                        'March',
                        'April',
                        'May',
                        'June',
                        'July',
                        'Aug',
                        'Sept',
                        'Oct',
                        'Nov',
                        'Dec'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                )),
            Container(
              height: 90,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedDate = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0)),
                          color: selectedDate == index ? Color(0xff181059) : Colors.white,
                          border: Border.all(
                            color: Color(0xffC4C4C4),
                          ),
                        ),
                        margin: EdgeInsets.all(5),
                        height: 73.58,
                        width: 49.34,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 13, 0, 10),
                              child: Text(
                                DateFormat('E').format(DateTime.now().add(Duration(days: index))),
                                style: TextStyle(color: selectedDate == index ? Colors.white : Colors.black),
                              ),
                            ),
                            Center(
                              child: Text(
                                DateFormat('d').format(DateTime.now().add(Duration(days: index))),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedDate == index ? Colors.white : Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }) /*DatePicker(
                DateTime.now(),

                height: 73,width: 49,
                dateTextStyle: TextStyle(fontSize: 12),
                //monthTextStyle: TextStyle(fontSize: 12),
               // dayTextStyle: TextStyle(fontSize: 12),
                controller: _controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: Color(0xff181059),
                selectedTextColor: Colors.white,



                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedValue = date;
                  });
                },
              )*/
              ,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Divider(thickness: 1.5),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Items",
                  style: TextStyle(color: labelGrey, fontSize: 15, fontWeight: FontWeight.w600),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 16, right: 14, bottom: 4),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  child: Column(children: [
                    Container(
                      height: 130,
                      child: Row(
                        children: [
                          Image.asset("assets/images/Customer Fabric Photo.png"),
                          Expanded(
                              child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.only(top: 10, left: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Description",
                                        style: TextStyle(color: labelGrey1, fontSize: 12, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Handwork Blouse",
                                        style:
                                            TextStyle(color: secondaryColor, fontSize: 15, fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 20),
                                       Row(
                                          children: [
                                             Text(
                                                      "Price",
                                                      style: TextStyle(
                                                          color: labelGrey1, fontSize: 12, fontWeight: FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      width: 100,
                                                    ),
                                                     Text(
                                                    "Quantity",
                                                    style: TextStyle(
                                                        color: labelGrey1, fontSize: 12, fontWeight: FontWeight.w500),
                                                  ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                             Row(
                                                      children: [
                                                        Text(
                                                          "₹",
                                                          style: TextStyle(
                                                              color: secondaryColor,
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                       SizedBox(width: 3,),
                                                                        Container(
                                                                          width: 40,
                                                                          // height: 30,
                                                                          child: TextField(
                                                                            decoration: InputDecoration(
                                                                               contentPadding: EdgeInsets.symmetric(horizontal: 1),
                                                                                border: InputBorder.none,
                                                                                focusedBorder: InputBorder.none,
                                                                                enabledBorder: InputBorder.none,
                                                                                errorBorder: InputBorder.none,
                                                                                disabledBorder: InputBorder.none,
                                                                                hintText: 'Price',
                                                                                hintStyle: TextStyle(fontSize: 14)),
                                                                          ),
                                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(width: 80,),
                                                   Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          _decrementCounter();
                                                        },
                                                        child: (_counter == 0)
                                                            ? Container()
                                                            : SvgPicture.asset("assets/images/Minus circle.svg",
                                                                height: 20, width: 20, color: secondaryColor),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                                        child: Text(
                                                          "$_counter",
                                                          style: TextStyle(
                                                              color: secondaryColor,
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          _incrementCounter();
                                                        },
                                                        child: SvgPicture.asset("assets/images/Add circle.svg",
                                                            height: 20, width: 20, color: secondaryColor),
                                                      ),
                                                    ],
                                                  ),  
                                          ],
                                        )
                                    ],
                                  ),
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/Delete.svg",
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => PreviewOrderBottom()));
                                        },
                                        child: SvgPicture.asset(
                                          "assets/images/Edit Order.svg",
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            newContainer = newContainer + 1;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          "assets/images/Duplicate.svg",
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                    ),
                    (newContainer == 0)
                        ? Container(
                            margin: EdgeInsets.zero,
                            height: 0,
                            width: 0,
                          )
                        : Container(
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: newContainer,
                                itemBuilder: (context, index) {
                                  return (index < 30)
                                      ? Container(
                                          margin: EdgeInsets.symmetric(vertical: 5),
                                          height: 135,
                                          child: Row(
                                            children: [
                                              Image.asset("assets/images/Customer Fabric Photo.png"),
                                              Expanded(
                                                  child: Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        child: Container(
                                                      padding: EdgeInsets.only(top: 10, left: 12),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Description",
                                                            style: TextStyle(
                                                                color: labelGrey1,
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w500),
                                                          ),
                                                          Text(
                                                            "Handwork Blouse",
                                                            style: TextStyle(
                                                                color: secondaryColor,
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w600),
                                                          ),
                                                          SizedBox(height: 20),
                                                            Row(
                                          children: [
                                             Text(
                                                      "Price",
                                                      style: TextStyle(
                                                          color: labelGrey1, fontSize: 12, fontWeight: FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      width: 100,
                                                    ),
                                                     Text(
                                                    "Quantity",
                                                    style: TextStyle(
                                                        color: labelGrey1, fontSize: 12, fontWeight: FontWeight.w500),
                                                  ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                             Row(
                                                      children: [
                                                        Text(
                                                          "₹",
                                                          style: TextStyle(
                                                              color: secondaryColor,
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                       SizedBox(width: 3,),
                                                                        Container(
                                                                          width: 40,
                                                                          // height: 30,
                                                                          child: TextField(
                                                                            decoration: InputDecoration(
                                                                               contentPadding: EdgeInsets.symmetric(horizontal: 1),
                                                                                border: InputBorder.none,
                                                                                focusedBorder: InputBorder.none,
                                                                                enabledBorder: InputBorder.none,
                                                                                errorBorder: InputBorder.none,
                                                                                disabledBorder: InputBorder.none,
                                                                                hintText: 'Price',
                                                                                hintStyle: TextStyle(fontSize: 14)),
                                                                          ),
                                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(width: 80,),
                                                   Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          _decrementCounter();
                                                        },
                                                        child: (_counter == 0)
                                                            ? Container()
                                                            : SvgPicture.asset("assets/images/Minus circle.svg",
                                                                height: 20, width: 20, color: secondaryColor),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                                        child: Text(
                                                          "$_counter",
                                                          style: TextStyle(
                                                              color: secondaryColor,
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          _incrementCounter();
                                                        },
                                                        child: SvgPicture.asset("assets/images/Add circle.svg",
                                                            height: 20, width: 20, color: secondaryColor),
                                                      ),
                                                    ],
                                                  ),  
                                          ],
                                        )
                                                        ],
                                                      ),
                                                    )),
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 5),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                newContainer = newContainer - 1;
                                                              });
                                                            },
                                                            child: SvgPicture.asset(
                                                              "assets/images/Delete.svg",
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => PreviewOrderBottom()));
                                                            },
                                                            child: SvgPicture.asset(
                                                              "assets/images/Edit Order.svg",
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                newContainer = newContainer + 1;
                                                              });
                                                            },
                                                            child: SvgPicture.asset(
                                                              "assets/images/Duplicate.svg",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                                        )
                                      : Container();
                                }),
                          ),
                    SizedBox(height: 5),
                    Container(
                      height: 105,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Total",
                                style: TextStyle(color: labelGrey, fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  "₹ 3600.00",
                                  style: TextStyle(
                                      color: Color.fromRGBO(171, 183, 208, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 2),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Grand Total",
                                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "₹ 3600.00",
                                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                ),
                Positioned(
                  bottom: 90,
                  child: InkWell(
                    onTap: () {
                      showModel();
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 7, bottom: 7, left: 14, right: 25),
                      height: 37,
                      width: 160,
                      decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(26)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/Add circle.svg",
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Add Items",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            GestureDetector(
              // behavior: HitTestBehavior.translucent,
              onTap: () {
                /*Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 300),
                            type: PageTransitionType.leftToRight,
                            child: GeneratedBill()),
                        ModalRoute.withName(""));*/
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GeneratedBill()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(15),
                height: 55,
                decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(33))),
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Text(
                      "Generate Bill",
                      style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
            )
          ]))),
          GestureDetector(
            // behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                      duration: Duration(milliseconds: 300),
                      type: PageTransitionType.leftToRight,
                      child: PreviewOrderBottom()),
                  ModalRoute.withName(""));
            },
            child: Container(
              padding: EdgeInsets.only(top: 50, left: 15),
              child: Icon(
                Icons.arrow_back_ios,
                color: primaryColor,
              ),
            ),
          ),
        ]));
  }
}
