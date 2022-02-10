import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quikieappps1/customer/addcustomer.dart';

// ignore: must_be_immutable
class Todaycustomers extends StatelessWidget {
  double? width, height = 57.0;
  double customFontSize = 12;
  String defaultFontFamily = 'Roboto-Light.ttf';

  @override
  Widget build(BuildContext context) {
    return Container(  
      height: MediaQuery.of(context).size.height*0.15,
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCustomer()));
                },
                child: DottedBorder(
                  dashPattern: [8,4],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(30),
                  padding: EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Color(0xffE986BB),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Add Customers",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: 'Roboto-Light.ttf',
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(255, 193, 168, 10),
                ),
                child: RawMaterialButton(
                    onPressed: () {},
                    shape: CircleBorder(),
                    child: Image.asset(
                      'assets/images/Memoji (1).png',
                      height: 50,
                    )),
              ),
              Text(
                "Aruna",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: 'Roboto-Light.ttf',
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(188, 222, 255, 10)),
                child: RawMaterialButton(
                    onPressed: () {},
                    shape: CircleBorder(),
                    child: Image.asset(
                      'assets/images/Memoji.png',
                      height: 50,
                    )),
              ),
              Text(
                "Nalini",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: 'Roboto-Light.ttf',
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(244, 236, 156, 10)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    FontAwesomeIcons.user,
                    color: Color(0xFFC1A17C),
                  ),
                ),
              ),
              Text(
                "Lakshmi",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    FontAwesomeIcons.user,
                    color: Color(0xFF5EB699),
                  ),
                ),
              ),
              Text(
                "Rekha",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(244, 236, 156, 10)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    FontAwesomeIcons.user,
                    color: Color(0xFF4D9DA7),
                  ),
                ),
              ),
              Text(
                "Vijaya",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          )
        ],
      ),
    );
  }
}
