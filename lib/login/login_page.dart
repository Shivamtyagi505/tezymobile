import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/login/login_page_controller.dart';
import 'package:quikieappps1/screens/welcome1.dart';
import 'package:quikieappps1/util/validators.dart';

class PreLoginScreeDesign extends StatefulWidget {
  @override
  _PreLoginScreeDesignState createState() => _PreLoginScreeDesignState();
}

class _PreLoginScreeDesignState extends State<PreLoginScreeDesign> {
  final _formKey = GlobalKey<FormState>();

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
    return Consumer<LoginController>(builder: (context, value, child) {
      return Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    //  height: height*0.5,
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/Logo2.png',
                      fit: BoxFit.fitHeight,
                      height: 200,
                    ),
                  ),
                  Container(
                      // height:height*0.5 ,
                      margin: EdgeInsets.only(top: 240),
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(35.0),
                        ),
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            width: width,
                            height: 69,
                            child: Text(
                              "Tezy",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55, color: Color(0xFF02D3FF)),
                            )),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                            width: width,
                            child: Text(
                              "Login to your Account",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          height: 55.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            validator: (value) => validateEmail(value!),
                            controller: value.emailIdController,
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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          height: 55.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            validator: (value) => validatePassword(value!),
                            focusNode: passwordFocusNode,
                            controller: value.passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              labelText: 'Password',
                              hintText: 'Enter Password',
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                value.login(context);
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: 296,
                              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xff029EFF),
                                borderRadius: BorderRadius.all(Radius.circular(80.0)),
                              ),
                              child: value.loginModel != null
                                  ? CircularProgressIndicator(color: Colors.white)
                                  : Text(
                                      'Sign in',
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                            )),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => welcomeScreen1()));
                          },
                          child: Container(
                            height: 55,
                            width: 296,
                            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
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
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => welcomeScreen1()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: height * 0.001),
                            width: width,
                            height: height * 0.05,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Text(
                                "Don’t have an account ?",
                                style: TextStyle(fontSize: 11, color: Color.fromRGBO(3, 43, 119, 10)),
                              ),
                              Text("Register !", style: TextStyle(fontSize: 11, color: Colors.redAccent)),
                            ]),
                          ),
                        ),
                      ])),
                ],
              ),
            ),
            //color: Colors.white,
          ),
        ),
      );
    });
  }
}
