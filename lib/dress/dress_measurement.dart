import '../bodymeasure/horizontal_numberpicker_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quikieappps1/dress/design/select_front_design.dart';
import 'package:quikieappps1/dress/input_sample_dress.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Color.fromRGBO(229, 229, 229, 10),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Dress',
            style: TextStyle(
              fontSize: 24.0,
              color: Color.fromRGBO(3, 43, 119, 10),
              fontWeight: FontWeight.normal,
              fontFamily: 'Productsans',
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'CM',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromRGBO(3, 43, 119, 10),
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Productsans',
                    ),
                  ),
                )),
          ],
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20.0,
                color: Color.fromRGBO(3, 43, 119, 10),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              }),
        ),
        body: Container(
            child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 250, bottom: 10),
                    child: Text(
                      'Scroll to Select',
                      style: TextStyle(
                        color: Color(0xff032B77),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 150, bottom: 10),
                    child: Image.asset(
                      "assets/images/Scroll To Select.png",
                      height: 30,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Opacity(
                        opacity: 0.7,
                        child: Image.asset("assets/images/3d woman 1.png")),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white
                  // color: Color.fromRGBO(229, 229, 229,
                  //     10), //color:Color.fromRGBO(255, 245, 229, 100),
                ),
                child: Text(
                  'Select Measurement Below',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Productsans',
                      color: Color.fromRGBO(3, 43, 119, 10)),
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 10),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Full Length',),
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Shoulder',),
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Chest Round',),
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Waist Round',),
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Waist Band Length',),
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Sleeves Length',),
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Sleeves Round',),
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Arm Hole Round',),
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Front Neck Deep',),
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Back Neck Deep',),
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Neck Width',),
                                SizedBox(
                                  height: 10.0,
                                  width: 12,
                                ),
                                CustomHorizontalPicker(name: 'Burst Point',),
                                Divider(height: 20),
                              ])),
                    ),
                  ),
                )
              ])
            ])),
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
                    MaterialPageRoute(builder: (context) => input_sample_dress()),
                  );
                },
                child: Image.asset("assets/images/Previous.png"),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => select_front_design()),
                  );
                },
                child: Image.asset("assets/images/Next.png"),
              )
            ],
          ),
        ));
  }
}

class CustomHorizontalPicker extends StatelessWidget {
  final String name;
  const CustomHorizontalPicker({
     this.name,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(3, 43, 119, 1),
              Color.fromRGBO(3, 43, 119, 1),
              Colors.white,
              Colors.white,
            ]),
        border: Border.all(
            color: Colors.black, // Set border color
            width: 1.0), // Set border width
        borderRadius: BorderRadius.all(
            Radius.circular(20.0)), // Set rounded corner radius
        // Make rounded corner of border
      ),
      child: HorizontalNumberPickerWrapper(
        scaleTextColor: Colors.black  ,
        scaleColor: Color.fromRGBO(3, 43, 119, 1),
        initialValue: 95,
        minValue: 10,
        maxValue: 200,
        step: 1,
        unit: 'CM',
        name: name,
        widgetWidth: MediaQuery.of(context).size.width.round() - 30,
        subGridCountPerGrid: 10,
        subGridWidth: 8,
        onSelectedChanged: (value) {}, titleTransformer: (int ) { return ''; }, scaleTransformer: (int ) {return '';  },
      ),
    );
  }
}
