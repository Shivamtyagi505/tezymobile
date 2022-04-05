import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/blouse/input_sample.dart';
import 'package:quikieappps1/customer/addcustomer.dart';
import 'package:quikieappps1/customer/select_customer/search_controller.dart';
import 'package:quikieappps1/customer/select_customer/search_model.dart';
import 'package:quikieappps1/customer/select_customer/select_cutsomer_controller.dart';

import '../../allcustomerpage/Controller/customer_services.dart';
import '../../allcustomerpage/Model/customers_model.dart';

class selectCustomer extends StatefulWidget {
  @override
  selectCustomerState createState() => selectCustomerState();
}

class selectCustomerState extends State<selectCustomer> {
  int _currentPage = 0,
      _index = 0;

  TextEditingController searchController = TextEditingController();
  String search = "";
  @override
  void initState() {
    var provider =
    Provider.of<SelectCustomerController>(context, listen: false);
    provider.fetchAllCustomerApi();
    provider.getShopUserName();
    customerModelData();
    super.initState();
  }

  AllCustomers? customer;
  AllCustomers? customer2;

  void customerModelData() async {
    customer2 = await allCustomerModel();
    setState(() {
      customer = customer2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectCustomerController>(builder: (context, value, child) {
      return value.allCustomerModel == null
          ? Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
        backgroundColor: Color(0xffF4F8FC),
        appBar: new AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xffF4F8FC),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20.0,
                color: Color.fromRGBO(3, 43, 119, 10),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          title: Text(
            'Select Customers',
            style: TextStyle(
                color: Color.fromRGBO(3, 43, 119, 10), fontSize: 22.0),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 10),
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
                                offset: Offset(
                                    0, 7), // changes position of shadow
                              ),
                            ],
                            color: Colors.white),
                      child: TextField(
                        onChanged: (String? value) {
                          setState(() {
                            search = value.toString();
                          });
                        },
                        controller: searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // labelText: "Search...",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          // suffixIcon: Icon(Icons.clear_rounded),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:
                      customer?.data.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        int itemCount =
                            customer?.data.length ??
                                0; //customer?.data.length
                        int reversedIndex = itemCount - 1 - index;
                        //final user = searchItem[191];
                        late String position = value
                            .allCustomerModel!
                            .data![reversedIndex]
                            .attributes!
                            .name
                            .toString();
                        if(searchController.text.isEmpty) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => input_sample()));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 13),
                              height: 90,
                              child: Row(
                                children: [
                                  Image.asset(
                                      "assets/images/customer2.png"),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            left: 12,
                                            right: 10,
                                            bottom: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 150,
                                                  child: Text(
                                                    // user.toString(),
                                                    value
                                                        .allCustomerModel!
                                                        .data![reversedIndex]
                                                        .attributes!
                                                        .name
                                                        .toString(),
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.w700),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 10),
                                                  child: Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            17, 112, 222, 1),
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.w400),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  "Bills ${value
                                                      .filteredAllCustomerModel
                                                      ? [reversedIndex]
                                                      .invoiceNumber ?? '33'}",
                                                  //value.filteredAllCustomerModel.,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          17, 112, 222, 1),
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 50,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff032B77),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                                  child: Text(
                                                    "Select",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15))),
                            ),
                          );
                        }
                        else if(position.toLowerCase().contains(searchController.text.toLowerCase())) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => input_sample()));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 13),
                              height: 90,
                              child: Row(
                                children: [
                                  Image.asset(
                                      "assets/images/customer2.png"),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            left: 12,
                                            right: 10,
                                            bottom: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 150,
                                                  child: Text(
                                                    position.toString(),
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.w700),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 10),
                                                  child: Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            17, 112, 222, 1),
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.w400),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  "Bills ${value
                                                      .filteredAllCustomerModel
                                                      ? [reversedIndex]
                                                      .invoiceNumber ?? '33'}",
                                                  //value.filteredAllCustomerModel.,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          17, 112, 222, 1),
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 50,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff032B77),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                                  child: Text(
                                                    "Select",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15))),
                            ),
                          );

                        }
                        else {
                          return Container();
                        }

                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddCustomer()),
                            );
                          },
                          backgroundColor: Color.fromRGBO(3, 43, 119, 10),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Add New Customer',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      );
    });
  }
}
//   Widget buildSearch() => SearchWidget(
//         text: query,
//         hintText: 'Search...',
//         onChanged: searchBook,
//       );
//
//   Future searchBook(String query) async {
//     final users = await FetchSearch.getUserList(query);
//
//     if (!mounted) return;
//
//     setState(() {
//       this.query = users as String;
//     });
//   }
// }

// class SearchWidget extends StatefulWidget {
//   final String text;
//   final ValueChanged<String> onChanged;
//   final String hintText;
//
//   const SearchWidget({
//     Key? key,
//     required this.text,
//     required this.onChanged,
//     required this.hintText,
//   }) : super(key: key);
//
//   @override
//   _SearchWidgetState createState() => _SearchWidgetState();
// }
//
// class _SearchWidgetState extends State<SearchWidget> {
//   final controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final styleActive = TextStyle(color: Colors.black);
//     final styleHint = TextStyle(color: Colors.black54);
//     final style = widget.text.isEmpty ? styleHint : styleActive;
//
//     return Container(
//       height: 42,
//       margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         border: Border.all(color: Colors.black26),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           icon: Icon(Icons.search, color: style.color),
//           suffixIcon: widget.text.isNotEmpty
//               ? GestureDetector(
//                   child: Icon(Icons.close, color: style.color),
//                   onTap: () {
//                     controller.clear();
//                     widget.onChanged('');
//                     FocusScope.of(context).requestFocus(FocusNode());
//                   },
//                 )
//               : null,
//           hintText: widget.hintText,
//           hintStyle: style,
//           border: InputBorder.none,
//         ),
//         style: style,
//         onChanged: widget.onChanged,
//       ),
//     );
//   }
// }
