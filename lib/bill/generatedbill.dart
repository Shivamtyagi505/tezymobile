import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/api/create_order/create_order_services.dart';
import 'package:quikieappps1/bill/generate_bill_controller.dart';
import 'package:quikieappps1/blouse/design/select_design/select_design_controller.dart';
import 'package:quikieappps1/blouse/place_order/place_order_controller.dart';
import 'package:quikieappps1/blouse/place_order/place_order_model.dart';
import 'package:quikieappps1/customer/select_customer/select_cutsomer_controller.dart';
import 'package:quikieappps1/home/home_page/homepage_controller.dart';

import 'package:dotted_line/dotted_line.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/blouse/review/blousereview.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class GeneratedBill extends StatefulWidget {
  List<PlaceOrderList>? placeOrderList;
  var fabricImage;
  double grandTotal;
  int selectedDate;
  int quantity;
  GeneratedBill(
      {this.placeOrderList,
      this.fabricImage,
      required this.grandTotal,
      required this.selectedDate,
      required this.quantity});
  @override
  GeneratedBillState createState() => GeneratedBillState();
}

class GeneratedBillState extends State<GeneratedBill> {
  final pricecontroller = TextEditingController();
  String inputString = "";
  var fabricImage;

  int tap = 0;

  Future _asyncInputDialog(BuildContext context) async {
    String teamName = '';

    return showDialog(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            child: Center(
              child: Column(children: [
                // IconButton(onPressed: Navigator.of(context).pop();, icon: icon),
                Text(
                  'Add Advance Payment',
                  style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10)),
                ),
              ]),
            ),
          ),
          content: new Row(
            children: [
              new Expanded(
                  child: Container(
                      height: 52,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87), borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        controller: pricecontroller,
                        autofocus: true,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            prefix: Text('₹', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            hintText: 'Enter Amount'),
                        onChanged: (value) {
                          teamName = value;
                        },
                      ))),
            ],
          ),
          actions: [
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    addItemToList();
                  },
                  child: Text('Ok'),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Color.fromRGBO(3, 43, 119, 10),
                    onPrimary: Colors.white,
                  ),
                ))
          ],
        );
      },
    );
  }

  List<String> Date = [];

  List<String> price = [];
  void addItemToList() {
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MMM-yyyy');
    final String formatted = formatter.format(now);

    setState(() {
      Date.insert(0, formatted);

      price.insert(0, inputString);
    });
  }

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

  @override
  void initState() {
    var provider = Provider.of<GenerateBillController>(context, listen: false);
    provider.amount = widget.grandTotal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
    return Consumer3<HomepageController, GenerateBillController, BlouseSelectDesignController>(
        builder: (context, value, generateBill, selectDesign, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromRGBO(17, 112, 222, 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Column(children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      Image.asset("assets/images/Butique Profile.png"),
                    ]),
                    Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Text("${value.username}",
                            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600)),
                        SizedBox(height: 2),
                        Text("Address: Basaveshwarangar,Bangalore",
                            style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Mobile : +91 99999 999999",
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ])),
              Container(
                height: 20,
                width: 10,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
              ),
              Container(
                height: height * 0.7,
                width: MediaQuery.of(context).size.width - 10.0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text("RECEIPT",
                            style: TextStyle(
                                color: Color.fromRGBO(95, 93, 93, 10), fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 2.0,
                          dashLength: 4.0,
                          dashColor: Colors.black,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                      SizedBox(height: 3),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("To",
                                style: TextStyle(
                                    color: Color.fromRGBO(3, 43, 119, 10), fontSize: 15, fontWeight: FontWeight.w500)),
                            Text("Date Of Order : ",
                                style: TextStyle(
                                    color: Color.fromRGBO(151, 151, 151, 10),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      Consumer<SelectCustomerController>(builder: (context, value, child) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${value.allCustomerAttributes!.name}",
                                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                              Text(formattedDate,
                                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        );
                      }),
                      Consumer<SelectCustomerController>(builder: (context, value, child) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text("Mobile No: ${value.allCustomerAttributes!.mobile}",
                              style: TextStyle(
                                  color: Color.fromRGBO(151, 151, 151, 10), fontSize: 10, fontWeight: FontWeight.w400)),
                        );
                      }),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Address:Basaveshwarnangara, Bangalore",
                            style: TextStyle(
                                color: Color.fromRGBO(151, 151, 151, 10), fontSize: 10, fontWeight: FontWeight.w400)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("E-mail:",
                            style: TextStyle(
                                color: Color.fromRGBO(151, 151, 151, 10), fontSize: 10, fontWeight: FontWeight.w400)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 2.0,
                          dashLength: 4.0,
                          dashColor: Colors.black,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Bill No:",
                                style: TextStyle(
                                    color: Color.fromRGBO(151, 151, 151, 10),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500)),
                            Text("DUE DATE",
                                style: TextStyle(
                                    color: Color.fromRGBO(151, 151, 151, 10),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      Consumer<PlaceOrderController>(builder: (context, value, child) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${value.invoiceNumber!.data!.attributes!.nextInvoiceNumberSuggestion}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(3, 43, 119, 10),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              Text("${formatDate(value.selectedValue, [dd, M, yyyy])}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(3, 43, 119, 10),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        );
                      }),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 2.0,
                          dashLength: 4.0,
                          dashColor: Colors.black,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                      SizedBox(height: 5),
                      ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.placeOrderList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return BillWidget(
                              image: Image.file(
                                widget.placeOrderList![index].file!,
                                fit: BoxFit.fill,
                              ),
                              quantity: widget.placeOrderList![index].quantity!,
                              amount: widget.placeOrderList![index].priceTotal,
                              price: widget.placeOrderList![index].price!,
                              index: index,
                              type: widget.placeOrderList![index].orderType!,
                            );
                          }),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => blousereview()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      padding: EdgeInsets.all(15),
                      height: 43,
                      width: MediaQuery.of(context).size.width - 10.0,
                      decoration: BoxDecoration(color: Color(0xff1170DE), borderRadius: BorderRadius.circular(14)),
                      child: Center(
                          child: Text(
                        'View Order Detiles & Measurement',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                      )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 7),
                  width: MediaQuery.of(context).size.width - 4,
                  color: Color.fromRGBO(243, 247, 251, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Total",
                          style: TextStyle(
                              color: Color.fromRGBO(104, 104, 104, 10), fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          generateBill.amount.toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(17, 112, 222, 10), fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              price.length == 0
                  ? Container(
                      margin: EdgeInsets.zero,
                      height: 0,
                      width: 0,
                    )
                  : Container(
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: price.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width - 4,
                                  color: Color.fromRGBO(243, 247, 251, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${Date[index]}",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(104, 104, 104, 10),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "Advance Received",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(104, 104, 104, 10),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ])),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Text(
                                          "₹ ${price[index]}",
                                          style: TextStyle(
                                              color: Color.fromRGBO(88, 165, 92, 10),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          })),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 40,

                  margin: EdgeInsets.symmetric(vertical: 7),
                  width: MediaQuery.of(context).size.width - 4,
                  color: Color.fromRGBO(243, 247, 251, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Balance",
                          style: TextStyle(
                              color: Color.fromRGBO(104, 104, 104, 10), fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          generateBill.remaining.toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(17, 112, 222, 10), fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),

                  //SizedBox(height: 5),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                      height: 80,
                      margin: EdgeInsets.symmetric(vertical: 7),
                      width: MediaQuery.of(context).size.width - 4,
                      color: Color.fromRGBO(243, 247, 251, 10),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              tap == 4
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Alert"),
                                          content: Text("Cant add advance"),
                                        );
                                      })
                                  : showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Center(
                                              child: Column(children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Icon(Icons.close, color: Color.fromRGBO(3, 43, 119, 10)),
                                              ),
                                            ),
                                            Text("Add Advance",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14.0,
                                                    color: Color.fromRGBO(3, 43, 119, 10))),
                                          ])),
                                          content: Container(
                                            height: 52,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black87),
                                                borderRadius: BorderRadius.circular(5)),
                                            child: TextFormField(
                                              controller: generateBill.textController,
                                              keyboardType: TextInputType.number,
                                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                              autofocus: true,
                                              decoration: new InputDecoration(
                                                  border: InputBorder.none,
                                                  prefix: Text('₹',
                                                      style:
                                                          TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                                  hintText: 'Enter Amount'),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            Align(
                                                alignment: Alignment.center,
                                                child: FlatButton(
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(21.0)),
                                                  color: Color.fromRGBO(3, 43, 119, 10),
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context, generateBill.textController.text);
                                                    generateBill.calculateAmount();
                                                  },
                                                )),
                                          ],
                                        );
                                      },
                                    ).then((val) {
                                      setState(() {
                                        tap += 1;
                                        inputString = val;
                                        addItemToList();
                                      });
                                      //showDialog(context: context, builder: (BuildContex
                                    });
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                                height: 60,
                                child: Column(children: [
                                  Image.asset(
                                    "assets/images/advance_icon.png",
                                    height: 30,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Add Advance',
                                    style: TextStyle(
                                        color: Color.fromRGBO(24, 16, 89, 10),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ]))),
                        DottedLine(
                          direction: Axis.vertical,
                          lineLength: 50,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: Colors.black87,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                        GestureDetector(
                            onTap: () {
                              openwhatsapp();
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                                height: 60,
                                child: Column(children: [
                                  Image.asset("assets/images/share.png"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Whatsapp',
                                    style: TextStyle(
                                        color: Color.fromRGBO(24, 16, 89, 10),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ]))),
                        DottedLine(
                          direction: Axis.vertical,
                          lineLength: 50,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: Colors.black87,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                        GestureDetector(
                            onTap: () async {
                              await FlutterShare.share(
                                title: 'Heyy, Checkout Tezy Tailor App',
                                text: 'Heyyy, checkout Tezy Tailor App!',
                                linkUrl: '',
                                chooserTitle: 'Where do you want to share?',
                              );
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                height: 70,
                                child: Column(children: [
                                  Icon(Icons.share, color: Colors.black, size: 30),
                                  SizedBox(height: 10),
                                  Text(
                                    'Share or Print',
                                    style: TextStyle(
                                        color: Color.fromRGBO(24, 16, 89, 10),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  )
                                ])))
                      ]))),
              GestureDetector(
                onTap: () async {
                  await generateBill.createData(context);
                  createOrderApi(generateBill.createOrder, selectDesign.files);
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    height: 43,
                    width: 191,
                    decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(33))),
                    child: Center(
                      child: Text(
                        "Done",
                        style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ));
    });
  }
}

class BillWidget extends StatelessWidget {
  final Image image;
  final int quantity;
  final double amount;
  final String type;
  final String price;
  final int index;

  const BillWidget({
    required this.image,
    required this.quantity,
    required this.amount,
    required this.type,
    required this.price,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageController>(builder: (context, value, child) {
      var totalPrice = int.parse(price) * quantity;
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: 65,
                          child: ClipRRect(
                            child: image,
                            borderRadius: BorderRadius.circular(10),
                          )),
                      SizedBox(width: 20),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            type,
                            style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Rs.$price',
                            style: TextStyle(
                                color: Color.fromRGBO(151, 151, 151, 10), fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'View Details',
                            style: TextStyle(
                                color: Color.fromRGBO(17, 112, 222, 10), fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Product No: $index ',
                            style: TextStyle(
                                color: Color.fromRGBO(151, 151, 151, 10), fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      'Qty:$quantity',
                      style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      'Rs.${amount.toString()}',
                      style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: Colors.grey,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
          ),
        ],
      );
    });
  }
}





/*class WeirdBorder extends ShapeBorder {
  final double radius;
  final double pathWidth;

  WeirdBorder({@required this.radius, this.pathWidth = 1});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect, textDirection: textDirection), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => _createPath(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => WeirdBorder(radius: radius);

  Path _createPath(Rect rect) {
    final innerRadius = radius + pathWidth;
    final innerRect =
    Rect.fromLTRB(rect.left + pathWidth, rect.top + pathWidth, rect.right - pathWidth, rect.bottom - pathWidth);

    final outer = Path.combine(PathOperation.difference, Path()..addRect(rect), _createBevels(rect, radius));
    final inner = Path.combine(PathOperation.difference, Path()..addRect(innerRect), _createBevels(rect, innerRadius));
    return Path.combine(PathOperation.difference, outer, inner);
  }

  Path _createBevels(Rect rect, double radius) {
    return Path()
      ..addOval(Rect.fromCircle(center: Offset(rect.left, rect.top), radius: radius))
      ..addOval(Rect.fromCircle(center: Offset(rect.left + rect.width, rect.top), radius: radius))
      ..addOval(Rect.fromCircle(center: Offset(rect.left, rect.top + rect.height), radius: radius))
      ..addOval(Rect.fromCircle(center: Offset(rect.left + rect.width, rect.top + rect.height), radius: radius));
  }
}*/

