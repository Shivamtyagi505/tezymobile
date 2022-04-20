import 'package:flutter/material.dart';
import 'package:quikieappps1/bottomdesign/bottommeasurement.dart';
import 'package:quikieappps1/customer/addcustomer.dart';

class selectcustomerbottom extends StatefulWidget {
  @override
  selectcustomerState createState() => selectcustomerState();
}

class selectcustomerState extends State<selectcustomerbottom> {
  int _currentPage = 0, _index = 0;

  var editingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          style: TextStyle(color: Color.fromRGBO(3, 43, 119, 10), fontSize: 22.0),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                            offset: Offset(0, 7), // changes position of shadow
                          ),
                        ],
                        color: Color(0xffD3D3D4)),
                    child: TextField(
                      onChanged: (value) {},
                      controller: editingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // labelText: "Search...",
                        hintText: "Search...",
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.clear_rounded),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomMeasurement(
                                  selectVal: 100.25,
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 13),
                    height: 90,
                    child: Row(
                      children: [
                        Image.asset("assets/images/Rectangle 555.png"),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(top: 10, left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 11),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Customer Name",
                                          textAlign: TextAlign.left,
                                          style:
                                              TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 30, 10, 0),
                                          child: Text(
                                            "Edit",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Color.fromRGBO(17, 112, 222, 1),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 17),
                              Padding(
                                padding: const EdgeInsets.only(right: 11),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "BILLs: 36",
                                      style: TextStyle(
                                          color: Color.fromRGBO(17, 112, 222, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Text(
                                      "View Measurement",
                                      style: TextStyle(
                                          color: Color.fromRGBO(17, 112, 222, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
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
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddCustomer()),
                      );
                    },
                    tooltip: 'Increment',
                    backgroundColor: Color.fromRGBO(3, 43, 119, 10),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
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
  }
}
