
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quikieappps1/blouse/input_sample.dart';

class UpdateBoutiqueDetails extends StatefulWidget {


  @override
  UpdateBoutiqueDetailsDesign createState() => UpdateBoutiqueDetailsDesign();
}

class UpdateBoutiqueDetailsDesign extends State<UpdateBoutiqueDetails> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFE5F3FD),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).padding.top + 27, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(onTap: (){
                        Navigator.pop(context);
                      },child: Icon(Icons.arrow_back_ios,color: Color(0xFF032B77),))),
                    Padding(
                      padding: EdgeInsets.only(right: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Boutique Detiles",
                            style:
                            TextStyle(fontSize: 25, color: Color(0xFF032B77)),
                          ),
                          Text("Add Boutique"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   Container(
                      margin: EdgeInsets.all(15),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff032B77),
                        border: Border.all(
                          color: Color.fromRGBO(3, 43, 119, 10),
                        ),
                      ),
                      child: Image.asset('assets/images/addcustomerprofile.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(27, 0, 24, 0),
                          child: Text("BOUTIQUE NAME",style: TextStyle(color: Color(0xFF032B77)),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Enter Boutique Name'),
                          ),
                        ),
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(27, 0, 24, 0),
                          child: Text("Mobile Number",style: TextStyle(color: Color(0xFF032B77)),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Enter Mobile Number'),
                          ),
                        ),
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(27, 0, 24, 0),
                          child: Text("Address",style: TextStyle(color: Color(0xFF032B77)),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Enter Your Address'),
                          ),
                        ),
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(27, 0, 24, 0),
                          child: Text("E-Mail",style: TextStyle(color: Color(0xFF032B77)),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Enter E-Mail Address'),
                          ),
                        ),
                      ],
                    ),
                    MaterialButton(
                      onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => input_sample()),);},
                      child: Text("Update Boutique Detiles",style: TextStyle(color: Colors.white),),
                      color: Color(0xFF032B77),
                      minWidth: 283,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0))),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
