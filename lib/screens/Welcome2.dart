import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quikieappps1/blouse/review.dart';
import 'package:quikieappps1/home/bottomNavigation.dart';
import 'package:quikieappps1/home/homepage.dart';

class welcomeScreen2 extends StatefulWidget {
  @override
  welcomeScreen2State createState() => welcomeScreen2State();
}

class welcomeScreen2State extends State<welcomeScreen2> {
  var emailIdController = TextEditingController();
  var passwordController = TextEditingController();

  /*
  * Global Instance of FocusNodes
  * */
  FocusNode emailIdFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF4F8FC),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white54,
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                  padding: const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 8.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 300,
                  child: Image.asset(
                    'assets/images/Logo.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Tezy",
                      style: TextStyle(
                          fontSize: 55.0, fontWeight: FontWeight.w600, color: Color.fromRGBO(0, 95, 175, 1)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Let's Sign In",
                      style: TextStyle(
                          fontSize: 35.0, fontWeight: FontWeight.w700, color: Color.fromRGBO(3, 43, 119, 10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 55.0,
                  child: TextFormField(
                    controller: emailIdController,
                    focusNode: emailIdFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Boutique Name/Number',
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(width: 1.5, color: Color.fromRGBO(0, 95, 175, 10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xff005FAF)),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      passwordFocusNode.requestFocus();
                    },
                    style: const TextStyle(fontSize: 16.0, fontFamily: 'Productsans', color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
          
                /*
                            * Password
                            * */
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 55.0,
                  child: TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(width: 1.5, color: Color.fromRGBO(0, 95, 175, 10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(width: 1, color: Color(0xff005FAF)),
                      ),
                    ),
                    style: const TextStyle(fontSize: 16.0, fontFamily: 'Productsans', color: Colors.black),
                  ),
                ),
          
                /*
                            * forgot Password
                            * */
          
                SizedBox(
                  height: 15.0,
                ),
          
                /*
                            * Login Btn
                            * */
                FlatButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 300),
                            type: PageTransitionType.leftToRight,
                            child: BottomNavigation()),
                        ModalRoute.withName(""));
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    width: 260.0,
                    height: 45.0,
                    decoration: const BoxDecoration(
                        color: Color(0xff032B77), borderRadius: BorderRadius.all(Radius.circular(80.0))),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Center(
                      child: Text('Sign In',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0, fontFamily: 'ProductSans', color: Colors.white)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20,bottom: 20),
                    child: Text(
                      'Forget Password',
                      style: TextStyle(color: Color(0xff1170DE)),
                    ))
              ],
            )),
          ],
        ),
          ),
        ));
  }
}
