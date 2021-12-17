  import 'package:flutter/material.dart';
class BottomNavDesignUpdated extends StatefulWidget {


  @override
  _BottomNavDesignUpdatedState createState() => _BottomNavDesignUpdatedState();
}

class _BottomNavDesignUpdatedState extends State<BottomNavDesignUpdated> {
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
    showSelectedLabels: false,   // <-- HERE
    showUnselectedLabels: false, // <-- AND HERE
    items: [
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/Home.png',),color: Colors.black,),label: ''),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/Order (1).png',),color: Colors.black,),label: ''),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/Design.png',),color: Colors.black,), label: ''),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/Customer.png',),color: Colors.black,), label: ''),
    ],
      currentIndex: _selectedTab,
     // iconSize: 35,
      onTap: (i) => _handleIndexChanged(i),
    );
  }
  var _selectedTab = 0;
  void _handleIndexChanged(int i) {
      setState(() {
      _selectedTab = i;
    });
  }
}

