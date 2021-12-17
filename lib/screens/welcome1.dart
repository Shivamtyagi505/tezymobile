import 'package:flutter/material.dart';
import 'package:quikieappps1/blouse/measurement.dart';
import 'package:quikieappps1/home/bottomNavigation.dart';

class welcomeScreen1 extends StatefulWidget {
  @override
  welcomeScreen1State createState() => welcomeScreen1State();
}

class welcomeScreen1State extends State<welcomeScreen1> {
  var emailIdController = TextEditingController();
  var passwordController = TextEditingController();
  var boutiqueController = TextEditingController();

  /*
  * Global Instance of FocusNodes
  * */
  FocusNode emailIdFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode nameFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white54,
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                      padding: const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 8.0, top: 10.0),
                      child: StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 100),
                                    child: Image.asset(
                                      'assets/images/Store Icon.png',
                                      width: 300.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      width: width,
                                      child: Text(
                                        "Create your Account",
                                        style:
                                            TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
                                      )),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      focusNode: nameFocusNode,
                                      controller: boutiqueController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                        labelText: 'Boutique Name',
                                        hintText: 'Enter Boutique Name',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      controller: emailIdController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                        labelText: 'Email',
                                        hintText: 'Enter Email',
                                      ),
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
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      controller: passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                        labelText: 'Password',
                                        hintText: 'Enter Password',
                                      ),
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
                                  /*InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => BottomNavigation()));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                      width: width,
                                      height: height * 0.07,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff029EFF),
                                          borderRadius: BorderRadius.all(Radius.circular(80.0))),
                                      // padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Center(
                                        child: Text('Sign Up',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18.0, fontFamily: 'ProductSans', color: Colors.white)),
                                      ),
                                    ),

                                  ),*/
                                  InkWell( onTap: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => BottomNavigation()));
                                  },
                                    child: Container(
                                      height: 55,
                                      width: 296,
                                      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                      decoration: const BoxDecoration(
                                        color: Color(0xff029EFF),
                                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Sign Up',
                                            style: TextStyle(color: Colors.white, fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(onTap: (){
                                   // Navigator.push(context, MaterialPageRoute(builder: (context) => welcomeScreen1()));
                                  },
                                    child: Container(
                                      height: 55,
                                      width: 296,
                                      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFE5F3FD),
                                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset(
                                            'assets/images/google 1.png',
                                          ),
                                          Text(
                                            'Sign in with Google ',
                                            style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  /*InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                      height: height * 0.05,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(107),
                                        color: Color(0xFFE5F3FD),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              icon: Image.asset(
                                                'assets/images/google 1.png',
                                              ),
                                              onPressed: () {}, //do something,
                                            ),
                                            Text(
                                              'Sign in with Google',
                                              style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),*/
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          })),
                ),
              ],
            ),
          ),
        ));
  }
}
