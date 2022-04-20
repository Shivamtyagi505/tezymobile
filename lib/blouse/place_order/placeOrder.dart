import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quikieappps1/bill/generate_bill_controller.dart';
import 'package:quikieappps1/bill/generatedbill.dart';
import 'package:quikieappps1/blouse/design/select_design/select_design_controller.dart';
import 'package:quikieappps1/blouse/place_order/place_order_controller.dart';
import 'package:quikieappps1/blouse/place_order/place_order_model.dart';
import 'package:quikieappps1/customer/select_customer/select_cutsomer_controller.dart';
import 'package:quikieappps1/home/bottomNavigation.dart';
import 'package:quikieappps1/home/home_page/homepage_controller.dart';
import 'package:quikieappps1/home/popularmenu.dart';
import 'package:quikieappps1/screens/previewOrders.dart';
import 'package:quikieappps1/util/custom_datePicker/date_picker_timeline.dart';

class PlaceOrder extends StatefulWidget {
  var fabricImage;
  PlaceOrder({this.fabricImage});
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  bool container = false;
  var nameController = TextEditingController();
  int selectedDate = 1;
  var fabricImage;
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
    Widget? child,
    double? all,
    Color? color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all!),
          color: color,
          child: child,
        ),
      );
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
    return Consumer<HomepageController>(builder: (context, value, child) {
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
                    Text("${value.username}",
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
    });
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
  void initState() {
    fabricImage = widget.fabricImage;
    var provider = Provider.of<PlaceOrderController>(context, listen: false);
    provider.fetchInvoiceNumberSuggestions();
    provider.getOrderType(context);
    provider.addPlaceItems(PlaceOrderList(provider.orderType, fabricImage, quantity: 1));
    provider.getAllLocalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<PlaceOrderController, BlouseSelectDesignController>(
        builder: (context, value, blouseController, child) {
      return value.invoiceNumber == null
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Color(0xffF3F7FB),
              body: Stack(alignment: Alignment.topLeft, children: [
                Container(
                    child: SingleChildScrollView(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Center(child: appBar()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Text("Customer Details",
                        style: TextStyle(color: grey, fontSize: 15, fontWeight: FontWeight.w400)),
                  ),
                  Consumer<SelectCustomerController>(builder: (context, value, child) {
                    return value.allCustomerAttributes != null
                        ? Container(
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
                                      Text("${value.allCustomerAttributes!.name}",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600)),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0.5,
                                      ),
                                      Text("Mobile No:  ${value.allCustomerAttributes!.mobile}",
                                          style: TextStyle(
                                              color: Color.fromRGBO(102, 102, 102, 1),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500)),
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
                          )
                        : Container(
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
                                      Text("Name : ",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600)),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0.5,
                                      ),
                                      Text("Mobile No: ",
                                          style: TextStyle(
                                              color: Color.fromRGBO(102, 102, 102, 1),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500)),
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
                          );
                  }),
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
                          child: Text('${value.invoiceNumber!.data!.attributes!.nextInvoiceNumberSuggestion}'),
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
                            value: value.dropdownValue ?? '',
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Color(0xff8E8D8D)),
                            onChanged: (newValue) {
                              setState(() {
                                value.dropdownValue = newValue!;
                                value.updateMonth();
                              });
                            },
                            items: <String>[
                              'Jan',
                              'Feb',
                              'Mar',
                              'Apr',
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
                  DatePicker(
                    DateTime.now(),
                    height: 73.58,
                    width: 49.34,
                    controller: value.controller,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Color(0xff181059),
                    selectedTextColor: Colors.white,
                    dateTextStyle: TextStyle(fontSize: 12),
                    inactiveDates: [],
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        value.selectedValue = date;
                      });
                    },
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
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: value.placeOrderItems.length,
                              itemBuilder: (BuildContext context, int index) {
                                value.quantity.add(1);
                                value.textEditingController!.add(TextEditingController(text: ''));
                                return Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  height: 130,
                                  child: Row(
                                    children: [
                                      Image.file(
                                        value.placeOrderItems[index].file!,
                                        fit: BoxFit.fill,
                                      ),
                                      Expanded(
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
                                                      color: labelGrey1, fontSize: 12, fontWeight: FontWeight.w500),
                                                ),
                                                Text(
                                                  value.placeOrderItems[index].orderType!,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: secondaryColor, fontSize: 15, fontWeight: FontWeight.w600),
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
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                        Container(
                                                          width: 40,
                                                          // height: 30,
                                                          child: TextField(
                                                            onSubmitted: (val) {
                                                              setState(() {
                                                                value.placeOrderItems[index].price = val;
                                                              });
                                                            },
                                                            keyboardType: TextInputType.number,
                                                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                            controller: value.textEditingController![index],
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
                                                    SizedBox(
                                                      width: 80,
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            value.decrementCounter(index);
                                                            value.placeOrderItems[index].quantity =
                                                                value.quantity[index];
                                                          },
                                                          child: (value.quantity[index] == 1)
                                                              ? Container()
                                                              : SvgPicture.asset("assets/images/Minus circle.svg",
                                                                  height: 20, width: 20, color: secondaryColor),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                                          child: Text(
                                                            "${value.quantity[index]}",
                                                            style: TextStyle(
                                                                color: secondaryColor,
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w600),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            value.incrementCounter(index);
                                                            value.placeOrderItems[index].quantity =
                                                                value.quantity[index];
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
                                                    // Navigator.push(context,
                                                    //     MaterialPageRoute(builder: (context) => PreviewOrders()));
                                                  },
                                                  child: SvgPicture.asset(
                                                    "assets/images/Edit Order.svg",
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      value.newContainer = value.newContainer + 1;
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
                                      ))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                                );
                              }),
                          (value.newContainer == 0)
                              ? Container(
                                  margin: EdgeInsets.zero,
                                  height: 0,
                                  width: 0,
                                )
                              : Container(
                                  child: ListView.builder(
                                      physics: ScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: value.newContainer,
                                      itemBuilder: (context, index) {
                                        return (index < 30)
                                            ? Container(
                                                margin: EdgeInsets.symmetric(vertical: 5),
                                                height: 135,
                                                child: Row(
                                                  children: [
                                                    Image.file(
                                                      fabricImage,
                                                      fit: BoxFit.fill,
                                                    ),
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
                                                                          color: labelGrey1,
                                                                          fontSize: 12,
                                                                          fontWeight: FontWeight.w500),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 100,
                                                                    ),
                                                                    Text(
                                                                      "Quantity",
                                                                      style: TextStyle(
                                                                          color: labelGrey1,
                                                                          fontSize: 12,
                                                                          fontWeight: FontWeight.w500),
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
                                                                        SizedBox(
                                                                          width: 3,
                                                                        ),
                                                                        Container(
                                                                          width: 40,
                                                                          // height: 30,
                                                                          child: TextField(
                                                                            keyboardType: TextInputType.number,
                                                                            inputFormatters: [
                                                                              FilteringTextInputFormatter.digitsOnly
                                                                            ],
                                                                            // controller: value.textEditingController,
                                                                            decoration: InputDecoration(
                                                                                contentPadding:
                                                                                    EdgeInsets.symmetric(horizontal: 1),
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
                                                                    SizedBox(
                                                                      width: 80,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap: () {
                                                                            // value.decrementCounter();
                                                                          },
                                                                          child: (value.quantity == 0)
                                                                              ? Container()
                                                                              : SvgPicture.asset(
                                                                                  "assets/images/Minus circle.svg",
                                                                                  height: 20,
                                                                                  width: 20,
                                                                                  color: secondaryColor),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 5),
                                                                          child: Text(
                                                                            "${value.quantity[index]}",
                                                                            style: TextStyle(
                                                                                color: secondaryColor,
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w600),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap: () {
                                                                            // value.incrementCounter();
                                                                          },
                                                                          child: SvgPicture.asset(
                                                                              "assets/images/Add circle.svg",
                                                                              height: 20,
                                                                              width: 20,
                                                                              color: secondaryColor),
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
                                                                      value.newContainer = value.newContainer - 1;
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
                                                                            builder: (context) => PreviewOrders()));
                                                                  },
                                                                  child: SvgPicture.asset(
                                                                    "assets/images/Edit Order.svg",
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      value.newContainer = value.newContainer + 1;
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
                                      "₹ ${value.grandTotalAmount}",
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
                        child: Consumer2<GenerateBillController, PlaceOrderController>(
                            builder: (context, generatedBill, placeOrder, child) {
                          return InkWell(
                            onTap: () {
                              if (placeOrder.textEditingController!.first.text != '') {
                                showModel();
                                generatedBill.clearLocalData(context);
                              } else {
                                Fluttertoast.showToast(msg: 'Please Add Price!!');
                              }
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
                          );
                        }),
                      ),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showAlertDialog(context);
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          margin: EdgeInsets.all(15),
                          height: 55,
                          decoration: BoxDecoration(
                              color: Color(0xffD8D8D8), borderRadius: BorderRadius.all(Radius.circular(33))),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GeneratedBill(
                                      placeOrderList: value.placeOrderItems,
                                      fabricImage: fabricImage,
                                      selectedDate: selectedDate,
                                      quantity: value.quantity[0],
                                      grandTotal: 0,
                                    )),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.all(15),
                          height: 55,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Color(0xff1170DE), borderRadius: BorderRadius.all(Radius.circular(33))),
                          child: Text(
                            "Generate Bill",
                            style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  )
                ]))),
                GestureDetector(
                  // behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
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
    });
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        setState(() {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigation()),
            (Route<dynamic> route) => false,
          );
        });
      },
    );
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
        });
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Tezy Alert"),
      content: Text("Do you want to cancel this Order?"),
      actions: [okButton, cancelButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class ViewOrderAndMeasurement {
  Map<String, double>? data;
  var frontImage;
  var backImage;
  var sleevesImage;
  var fabricImage;
  String? frontImageType;
  String? backImageType;
  String? sleevesImageType;
  bool? cups;
  bool? piping;
  String? zipType;
  String? hooks;

  String get cupsValue {
    if (cups == true) {
      return 'YES';
    } else {
      return 'NO';
    }
  }

  String get pipingValue {
    if (piping == true) {
      return 'YES';
    } else {
      return 'NO';
    }
  }

  ViewOrderAndMeasurement(
      {this.data,
      this.frontImage,
      this.backImage,
      this.sleevesImage,
      this.fabricImage,
      this.frontImageType,
      this.backImageType,
      this.sleevesImageType,
      this.cups,
      this.piping,
      this.zipType,
      this.hooks});
}
