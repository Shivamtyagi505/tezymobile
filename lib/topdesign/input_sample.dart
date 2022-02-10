
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quikieappps1/bodymeasure/input_sample_numberpicker.dart';
import 'package:quikieappps1/home/home_page/homepage.dart';
import 'package:quikieappps1/state_management/mob_store.dart';
import 'package:quikieappps1/topdesign/topmeasurement.dart';

class input_sample extends StatefulWidget {
  @override
  input_sampleState createState() => input_sampleState();
}

class input_sampleState extends State<input_sample> {
  ScaleNo scaleData=ScaleNo();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scaleData.setValue(48.00);
  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFE5F3FD),
        appBar: new AppBar(
          elevation: 0.0,
          backgroundColor:Color(0xFFE5F3FD),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20.0,
                color: Color.fromRGBO(3, 43, 119, 10),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Blouse',
                  style: TextStyle(
                      color: Color.fromRGBO(3, 43, 119, 10), fontSize: 22.0),
                ),
                Text(
                  'Select Measurement Below',
                  style: TextStyle(color: Colors.black87, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Container(
                    height: 178.8,
                    width: 77.0,
                    margin: EdgeInsets.fromLTRB(150, 15, 148, 0),
                    child: Image.asset(
                      'assets/images/Lady Taking Measurement.png',
                    ),
                  ),
                ),
                //do something,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text('We will Predicts The Body Measurement Later You Can Change Please Fill Your',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w300,height: 1.5),textAlign: TextAlign.center,)),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                  child: Text(
                "Shoulder",
                style: TextStyle(fontSize: 24, color: Colors.black87),
              )),
              Container(
                child: inputsamplePickerWrapper(
                  titleTextColor: Color(0xffF12874),
                  initialValue: 26.0,
                  minValue: 10.0,
                  maxValue: 120,
                  step: 1,
                  unit: 'INCH',
                  title: '',
                  widgetWidth: MediaQuery.of(context).size.width.round(),
                  subGridCountPerGrid: 10,
                  subGridWidth: 10,
                  onSelectedChanged: (value) {
                    print("what value select on shoulder scale : "+value.toString());
                    scaleData.setValue(value-2);
                  }, //scaleTransformer: (int ) {  return ''; }, titleTransformer: (int ) {  return ''; },
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                          duration:
                          Duration(milliseconds: 300),
                          type:
                          PageTransitionType.leftToRight,
                          child: HomePageScreen()),
                      ModalRoute.withName(""));
                },
                child: Image.asset("assets/images/Previous.png"),
              ),
              FloatingActionButton(
                onPressed: () {
                  double keyValue;
                   keyValue=(8+(scaleData.selectScaleValue!-8)*0.25);
print("keyVAlue : $keyValue");
                 /* Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                          duration:
                          Duration(milliseconds: 300),
                          type:
                          PageTransitionType.leftToRight,
                          child: HomePage(selectVal: keyValue)),
                      ModalRoute.withName(""));*/
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(selectVal: keyValue)),
                  );

                },
                child: Image.asset("assets/images/Next Step.png"),
              )
            ],
          ),
        ));
  }
}
