import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quikieappps1/home/bottomNavigation.dart';
import 'package:quikieappps1/login/login_page.dart';
import 'package:quikieappps1/util/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _data() async {
    try {
      Timer(
          Duration(seconds: 3),
          (await SharedData().userLogged())
              ? () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomNavigation()))
              : () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PreLoginScreeDesign())));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: Color(0xff032B77),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 60, bottom: 10),
              child: Image.asset('assets/images/splashtwo.png'),
            ),
            Text(
              'Tezy',
              style: TextStyle(
                fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Text(
              'Made with ❤ in India',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
