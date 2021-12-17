import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/blouse/measurement.dart';

class Hangings extends StatefulWidget {
  @override
  HangingsState createState() => HangingsState();
}

class HangingsState extends State<Hangings > {
   int _index;

  Widget category(String text) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(3,43,119,10),
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: labelGrey)),
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ));
  }
  Widget categories(String text) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(55, 55, 55, 1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: labelGrey)),
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ));
  }

  Widget imageContainer(String text) {
    return Container(
      child: Expanded(
        child: Stack(alignment: Alignment.topRight, children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              height: 180,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(180, 180, 180, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(
                  Icons.photo,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                height: 42,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Text(
                      text,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ))
          ]),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Icon(Icons.close, size: 15, color: Colors.white),
          )
        ]),
      ),
    );
  }

  Widget design(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: darkGrey),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 5, bottom: 10),
          child: Text(
            text,
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }

  Widget designSmall(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 195,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: darkGrey),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 5, bottom: 10),
          child: Text(text, style: TextStyle(fontSize: 10)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(244, 248, 252,10),
              child: Column(
                children: [
                  SizedBox(height: 35),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Color.fromRGBO(3,43,119,10)),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Text("Select Hangings",
                                style: TextStyle(
                                    color: Color.fromRGBO(3,43,119,10),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 5),
                            Center(
                              child: Text("Select Design or Upload Your Own",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w300)),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 32,
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(47),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        design("Scrlet Blouse Design"),
                        design("Scrlet Blouse Design"),
                        design("Scrlet Blouse Design")
                      ],
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        designSmall("Scrlet Blouse Design"),
                        design("Scrlet Blouse Design"),
                        design("Scrlet Blouse Design"),
                        SizedBox(height: 50)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50),


          child:
          Column(mainAxisAlignment: MainAxisAlignment.end,
              children:[ FloatingActionButton(
                backgroundColor: Color.fromRGBO(3,43,119,10),

                onPressed: () {

                },
                child: Icon(Icons.add,color: Colors.white,),
              ),
                Text("Upload Your Photo"),
                RaisedButton(
                  onPressed: () {},
                  color: Color.fromRGBO(3,43,119,10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33)),
                  child: Text("Save",style: TextStyle(color: Colors.white),),
                )


              ])),


    );
  }


}
