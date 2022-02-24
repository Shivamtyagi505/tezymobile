import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/blouse/input_sample.dart';
import 'package:quikieappps1/customer/addcustomer.dart';
import 'package:quikieappps1/customer/select_customer/select_cutsomer_controller.dart';

class selectcustomer extends StatefulWidget {
  @override
  selectcustomerState createState() => selectcustomerState();
}

class selectcustomerState extends State<selectcustomer> {
  int _currentPage = 0, _index = 0;

  var editingController;

  @override
  void initState() {
    var provider = Provider.of<SelectCustomerController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) {
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 10),
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
                      color: Colors.white),
                  child: TextField(
                    onChanged: (value) {},
                    controller: editingController,
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
                itemCount: 10,
                  itemBuilder: (BuildContext context,int index){
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 13),
                    height: 90,
                    child: Row(
                      children: [
                        Image.asset("assets/images/Rectangle 555.png"),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(top: 10, left: 12,right: 10,bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                      "Customer Name",
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          color: Color.fromRGBO(17, 112, 222, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "BILLs: 36",
                                    style: TextStyle(
                                        color: Color.fromRGBO(17, 112, 222, 1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0xff032B77),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text(
                                      "Select",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
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
                        color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                  );
                }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
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
