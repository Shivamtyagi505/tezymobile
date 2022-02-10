import 'package:flutter/material.dart';
import 'package:quikieappps1/bottomdesign/selectcustomerbottom.dart';
import 'package:quikieappps1/customer/selectcustomer.dart';
import 'package:quikieappps1/other_design/selectcustomerother.dart';
import 'package:quikieappps1/topdesign/selectcustomertop.dart';

class Tabview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var gridView1 = GridView.count(
      primary: false,
      padding: const EdgeInsets.all(1),
      crossAxisSpacing: 1,
      mainAxisSpacing: 20,
      crossAxisCount: 4,
      children: <Widget>[
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
        TabBarWidget(
          asset: 'assets/images/Rectangle 548.png',
          text: 'Lining Blouse',
        ),
        TabBarWidget(
          asset: 'assets/images/Rectangle 550.png',
          text: 'Lehnga Blouse',
        ),
        TabBarWidget(
          asset: 'assets/images/Rectangle 552.png',
          text: 'Blouse',
        ),
      ],
    );
    var gridView2 = GridView.count(
      primary: false,
      padding: const EdgeInsets.all(1),
      crossAxisSpacing: 1,
      mainAxisSpacing: 20,
      crossAxisCount: 4,
      children: <Widget>[
        TabBarWidgetupdated(
          asset: 'assets/images/updatedimage/gown.png',
          text: 'Gown',
        ),
        TabBarWidgetupdated(
          asset: 'assets/images/updatedimage/kurta.png',
          text: 'Kurta',
        ),
        TabBarWidgetupdated(
          asset: 'assets/images/updatedimage/salwar.png',
          text: 'Salwar',
        ),
        TabBarWidgetupdated(
          asset: 'assets/images/updatedimage/ghagra.png',
          text: 'Ghagra',
        ),
        TabBarWidgetupdated(
          asset: 'assets/images/updatedimage/churidar.png',
          text: 'Churidar',
        ),
        TabBarWidgetupdated(
          asset: 'assets/images/updatedimage/lehenga.png',
          text: 'Lehenga Blouse',
        )
      ],
    );
    var gridView3 = GridView.count(
      primary: false,
      padding: const EdgeInsets.all(1),
      crossAxisSpacing: 1,
      mainAxisSpacing: 20,
      crossAxisCount: 4,
      children: <Widget>[
        TabBarWidgetupdatedbottom(
          asset: 'assets/images/updatedimage/chudibottom.png',
          text: 'Chudi Bottom',
        ),
        TabBarWidgetupdatedbottom(
          asset: 'assets/images/updatedimage/salwarbottom.png',
          text: 'Salwar Bottom',
        ),
        TabBarWidgetupdatedbottom(
          asset: 'assets/images/updatedimage/patialacopy.png',
          text: 'Patiala',
        ),
        TabBarWidgetupdatedbottom(
          asset: 'assets/images/updatedimage/palanzzo.png',
          text: 'Palzzo',
        ),
        TabBarWidgetupdatedbottom(
          asset: 'assets/images/updatedimage/straitpant.png',
          text: 'Straight Pant',
        ),
        TabBarWidgetupdatedbottom(
          asset: 'assets/images/updatedimage/lehengabotoom.png',
          text: 'Lehenge Bottom',
        ),
      ],
    );
    var gridView4 = GridView.count(
        primary: false,
        padding: const EdgeInsets.all(1),
        crossAxisSpacing: 1,
        mainAxisSpacing: 20,
        crossAxisCount: 4,
        children: <Widget>[
          TabBarWidgetupdated(
            asset: 'assets/images/updatedimage/sareekrosha.png',
            text: 'Saree Krosha',
          ),
          TabBarWidgetupdated(
            asset: 'assets/images/updatedimage/sareezigzag.png',
            text: 'Saree Zig Zag',
          ),
          TabBarWidgetupdated(
            asset: 'assets/images/updatedimage/sareefalls.png',
            text: 'Saree Falls',
          ),
        ]);
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
          children: [
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
                          asset: 'assets/images/Rectangle 540.png',
                          text: 'Hand     Embroidery',
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
                        TabBarWidgettop(
                          asset: 'assets/images/updatedimage/gown.png',
                          text: 'Gown',
                        ),
                        TabBarWidgettop(
                          asset: 'assets/images/updatedimage/kurta.png',
                          text: 'Kurta',
                        ),
                        TabBarWidgettop(
                          asset: 'assets/images/updatedimage/salwar.png',
                          text: 'Salwar',
                        ),
                        TabBarWidgettop(
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
                        TabBarWidgettop(
                          asset: 'assets/images/updatedimage/churidar.png',
                          text: 'Churidar',
                        ),
                        TabBarWidgettop(
                          asset: 'assets/images/updatedimage/lehenga.png',
                          text: 'Lehenga Blouse',
                        ),
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: false,
                          child: TabBarWidgettop(
                            asset: 'assets/images/Rectangle 546.png',
                            text: 'Katori Blouse',
                          ),
                        ),
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: false,
                          child: TabBarWidgettop(
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
                        TabBarWidgetbottom(
                          asset: 'assets/images/updatedimage/chudibottom.png',
                          text: 'Chudi Bottom',
                        ),
                        TabBarWidgetbottom(
                          asset: 'assets/images/updatedimage/salwarbottom.png',
                          text: 'Salwar Bottom',
                        ),
                        TabBarWidgetbottom(
                          asset: 'assets/images/updatedimage/patialacopy.png',
                          text: 'Patiala',
                        ),
                        TabBarWidgetbottom(
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
                        TabBarWidgetbottom(
                          asset: 'assets/images/updatedimage/straitpant.png',
                          text: 'Straight Pant',
                        ),
                        TabBarWidgetbottom(
                          asset: 'assets/images/updatedimage/lehengabotoom.png',
                          text: 'Lehenge Bottom',
                        ),
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: false,
                          child: TabBarWidgetbottom(
                            asset: 'assets/images/Rectangle 546.png',
                            text: 'Katori Blouse',
                          ),
                        ),
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: false,
                          child: TabBarWidgetbottom(
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
                        TabBarWidgetOther(
                          asset: 'assets/images/updatedimage/sareekrosha.png',
                          text: 'Saree Krosha',
                        ),
                        TabBarWidgetOther(
                          asset: 'assets/images/updatedimage/sareezigzag.png',
                          text: 'Saree Zig Zag',
                        ),
                        TabBarWidgetOther(
                          asset: 'assets/images/updatedimage/sareefalls.png',
                          text: 'Saree Falls',
                        ),
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: false,
                          child: TabBarWidgetOther(
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
            // gridView1,
            // gridView2,
            //  gridView3,
            //  gridView4,
          ],
        ),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  final String? asset;
  final String? text;
  const TabBarWidget({
    this.asset,
    this.text,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => selectcustomer()));
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
  }
}
class TabBarWidgetOther extends StatelessWidget {
  final String? asset;
  final String? text;
  const TabBarWidgetOther({
    this.asset,
    this.text,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => selectcustomerother()));
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
  }
}
class TabBarWidgettop extends StatelessWidget {
  final String? asset;
  final String? text;
  const TabBarWidgettop({
    this.asset,
    this.text,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => selectcustomertop()));
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
  }
}
class TabBarWidgetbottom extends StatelessWidget {
  final String? asset;
  final String? text;
  const TabBarWidgetbottom({
    this.asset,
    this.text,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => selectcustomerbottom()));
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
  }
}

class TabBarWidgetupdated extends StatelessWidget {
  final String? asset;
  final String? text;
  const TabBarWidgetupdated({
    this.asset,
    this.text,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => selectcustomertop()));
      },
      child: Container(
        height: 95,
        width: 90,
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
                child:
                ClipRRect(
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
                flex: 3,
                child: Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff280D78), fontSize: 11, fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ),
    );
  }
}

class TabBarWidgetupdatedbottom extends StatelessWidget {
  final String? asset;
  final String? text;
  const TabBarWidgetupdatedbottom({
    this.asset,
    this.text,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => selectcustomerbottom()));
      },
      child: Container(
        height: 95,
        width: 90,
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
                flex: 3,
                child: Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff280D78), fontSize: 11, fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ),
    );
  }
}

