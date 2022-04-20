import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/blouse/input_sample/input_sample.dart';
import 'package:quikieappps1/customer/select_customer/select_cutsomer_controller.dart';
import 'package:quikieappps1/customer/select_customer/selectcustomer.dart';
import 'package:quikieappps1/home/home_page/homepage_controller.dart';

class Tabview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageController>(builder: (context, controller, child) {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 35,
            elevation: 0.0,
            backgroundColor: Color(0xffF4F8FC),
            title: Container(
              height: 30,
              child: TabBar(
                controller: controller.tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    // Creates border
                    color: Color.fromRGBO(24, 16, 89, 1)),
                unselectedLabelColor: Color.fromRGBO(151, 151, 151, 1),
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    text: 'Blouses',
                  ),
                  Tab(
                    text: 'Tops',
                  ),
                  Tab(
                    text: 'Bottom',
                  ),
                  Tab(
                    text: 'Others',
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TabBarWidget(
                            asset: 'assets/images/Rectangle 540.png',
                            text: 'Hand Embroidery',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/Rectangle 542.png',
                            text: 'Machine Embroidery',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/Rectangle 544.png',
                            text: 'Princes Cut Blouse',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/Rectangle 546.png',
                            text: 'Katori Blouse',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TabBarWidget(
                            asset: 'assets/images/Rectangle 548.png',
                            text: 'Lining Blouse',
                            index: 5,
                          ),
                          TabBarWidget(
                            asset: 'assets/images/Rectangle 550.png',
                            text: 'Lehnga Blouse',
                            index: 6,
                          ),
                          TabBarWidget(
                            asset: 'assets/images/Rectangle 552.png',
                            text: 'Blouse',
                            index: 7,
                          ),
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: false,
                            child: TabBarWidget(
                              asset: 'assets/images/Rectangle 546.png',
                              text: 'Katori Blouse',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  //  color: Colors.red,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/gown.png',
                            text: 'Gown',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/kurta.png',
                            text: 'Kurta',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/salwar.png',
                            text: 'Salwar',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/ghagra.png',
                            text: 'Ghagra',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/churidar.png',
                            text: 'Churidar',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/lehenga.png',
                            text: 'Lehenga Blouse',
                          ),
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: false,
                            child: TabBarWidget(
                              asset: 'assets/images/Rectangle 546.png',
                              text: 'Katori Blouse',
                            ),
                          ),
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: false,
                            child: TabBarWidget(
                              asset: 'assets/images/Rectangle 546.png',
                              text: 'Katori Blouse',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  //  color: Colors.red,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/chudibottom.png',
                            text: 'Chudi Bottom',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/salwarbottom.png',
                            text: 'Salwar Bottom',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/patialacopy.png',
                            text: 'Patiala',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/palanzzo.png',
                            text: 'Palzzo',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/straitpant.png',
                            text: 'Straight Pant',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/lehengabotoom.png',
                            text: 'Lehenge Bottom',
                          ),
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: false,
                            child: TabBarWidget(
                              asset: 'assets/images/Rectangle 546.png',
                              text: 'Katori Blouse',
                            ),
                          ),
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: false,
                            child: TabBarWidget(
                              asset: 'assets/images/Rectangle 546.png',
                              text: 'Katori Blouse',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  //  color: Colors.red,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/sareekrosha.png',
                            text: 'Saree Krosha',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/sareezigzag.png',
                            text: 'Saree Zig Zag',
                          ),
                          TabBarWidget(
                            asset: 'assets/images/updatedimage/sareefalls.png',
                            text: 'Saree Falls',
                          ),
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: false,
                            child: TabBarWidget(
                              asset: 'assets/images/Rectangle 546.png',
                              text: 'Katori Blouse',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class TabBarWidget extends StatelessWidget {
  final String? asset;
  final String? text;
  final int? index;
  const TabBarWidget({
    this.asset,
    this.text,
    this.index,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomepageController, SelectCustomerController>(
        builder: (context, controller, selectCustomerController, child) {
      return GestureDetector(
        onTap: () {
          if (selectCustomerController.allCustomerAttributes == null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => selectCustomer()));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => input_sample()));
          }
          controller.updateOrderType(text!);
        },
        child: Container(
          height: 95,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff8BCAFF),
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.5),
                        bottomRight: Radius.circular(30.5),
                        topLeft: Radius.circular(30.5),
                        bottomLeft: Radius.circular(30.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(0.7),
                      child: Image.asset(
                        asset!,
                        fit: BoxFit.fill,
                        height: 70,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  //  flex: 4,
                  child: Text(
                text!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff280D78), fontSize: 10, fontWeight: FontWeight.w500),
              )),
            ],
          ),
        ),
      );
    });
  }
}
