import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/blouse/review.dart';
import '../Controller/orders_services.dart';
import '../Model/orders_model.dart';

class Orders extends StatefulWidget {

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
   OrdersModel? order;
   OrdersModel? order2;

  void modelData() async {
    order2 = await ordersModel();
    setState(() {
      order = order2;
    });
  }

  @override
  void initState() {
    modelData();
    _futureOrdersModel = ordersModel();
    // ordersModel();
    super.initState();
  }

  Widget categoryCard(
      String imagePath, String title, int num, String subtitle) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          // height: 125,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Image.asset(
                  imagePath,
                  height: 70,
                ),
                Column(
                  children: [
                    Text(num.toString(),
                        style: TextStyle(
                            color: Color.fromRGBO(17, 112, 222, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                    Text(subtitle,
                        style: TextStyle(
                            color: labelGrey,
                            fontSize: 10,
                            fontWeight: FontWeight.w600))
                  ],
                ),
                SizedBox()
              ]),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 13, bottom: 9, right: 11),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                      SvgPicture.asset(
                        "assets/images/Add circle.svg",
                        color: Color.fromRGBO(17, 112, 222, 1),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBar() {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 7, right: 7),
            child: TabBar(
              isScrollable: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(69, 89, 210, 1)),
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: 'UPCOMING',
                ),
                Tab(
                  text: 'BILLS',
                ),
                Tab(
                  text: 'PENDING',
                ),
                Tab(
                  text: 'COMPLETED',
                ),
                Tab(
                  text: 'ALL ORDERS',
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: [
                categories(),
                categories(),
                categories(),
                categories(),
                categories(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget categories() {
    return buildFutureBuilder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Column(children: [
              SizedBox(height: 35),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {},
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Boutique Name",
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 13),
                        Center(
                          child: Text("4 Due Bills Today",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 48,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Search Order or Bills ",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ])),
            SizedBox(height: 13),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 248, 252, 1),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 27, top: 12),
                          child: Text("Categories",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Row(
                          children: [
                            categoryCard("assets/images/orders.png", "Pending ",
                                80, "ORDERS"),
                            categoryCard("assets/images/shopping-bag 1.png",
                                "Upcoming Orders ", 80, "ORDERS"),
                          ],
                        ),
                        Row(
                          children: [
                            categoryCard("assets/images/Group (1).png",
                                "View All Bills ", 80, "BILLS"),
                            categoryCard("assets/images/Group (2).png",
                                "Completed Orders ", 80, "COMPLETED"),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            child: tabBar(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  late Future<OrdersModel>? _futureOrdersModel;
  FutureBuilder<OrdersModel> buildFutureBuilder() {
    return FutureBuilder<OrdersModel>(
      future: _futureOrdersModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bool? checkedValue =
              order!.data.attributes.totalBills[0].manualBillCompletion;
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: snapshot.data!.data.attributes.totalBills.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Review()));
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order!.data.attributes.totalBills[0]
                                            .customerName.toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      // Text(
                                      //   "Handwork Blouse",
                                      //   textAlign: TextAlign.left,
                                      //   style: TextStyle(
                                      //       color: labelGrey,
                                      //       fontSize: 12,
                                      //       fontWeight: FontWeight.w600),
                                      // )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Due",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: labelGrey,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        order!.data.attributes.totalBills[0]
                                            .dueDate!.substring(3,16),
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            //SizedBox(height: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Bill No. ${snapshot.data!.data.attributes.totalBills[index].invoiceNumber}',
                                  style: TextStyle(
                                      color: Color.fromRGBO(17, 112, 222, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Expanded(child: SizedBox()),
                                checkedValue == false
                                    ? Row(
                                        children: [
                                          Text(
                                            "Not Completed",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    17, 112, 222, 1),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Checkbox(
                                              focusColor: Color(0xff1170DE),
                                              activeColor: Color(0xff1170DE),
                                              shape: CircleBorder(),
                                              value: checkedValue,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  checkedValue = newValue;
                                                });
                                              }),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Text(
                                            "Completed",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    17, 112, 222, 1),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Checkbox(
                                              focusColor: Color(0xff1170DE),
                                              activeColor: Color(0xff1170DE),
                                              shape: CircleBorder(),
                                              value: checkedValue,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  checkedValue = newValue;
                                                });
                                              }),
                                        ],
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
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                ),
              ); //categoryCard1();
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Column(
          children: [
            Center(child: const CircularProgressIndicator()),
          ],
        );
      },
    );
  }
}
