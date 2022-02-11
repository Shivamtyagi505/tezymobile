// import 'package:flutter/material.dart';
// import 'package:quikieappps1/home/popularmenu.dart';
// import 'package:quikieappps1/home/todaycustomers.dart';
// import 'package:quikieappps1/profile/profile_design.dart';

// import 'bottom_bar.dart';

// class HomePageUpdatedagain extends StatefulWidget {
//   @override
//   _HomePageUpdatedState createState() => _HomePageUpdatedState();
// }

// class _HomePageUpdatedState extends State<HomePageUpdatedagain> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         elevation: 0.0,
//         backgroundColor: Color(0xffF4F8FC),
//         title: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Boutique Name',
//               style: TextStyle(
//                   color: Color.fromRGBO(3, 43, 119, 10),
//                   fontSize: 22.0,
//                   fontFamily: 'Poppins'),
//             ),
//             Text(
//               'Today Mon, 17 sep',
//               style: TextStyle(
//                   color: Color.fromRGBO(3, 43, 119, 10), fontSize: 14.0),
//             )
//           ],
//         ),
//         actions: <Widget>[
//           Container(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ProfileScreen()),
//                     );
//                   },
//                   child: Image.asset('assets/images/profileimg.png')),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.26,
//             width: MediaQuery.of(context).size.width,
//             child: InkWell(
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Card(
//                   color: Color.fromRGBO(132, 175, 255, 0.9),
//                   elevation: 2.0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(11.0),
//                   ),
//                   child: Stack(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(
//                                 "assets/images/Background Design.png"),
//                             alignment: Alignment.bottomRight,
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment(-0.95, -0.85),
//                         child: Text(
//                           "Today",
//                           style: TextStyle(
//                               color: Color.fromRGBO(3, 43, 119, 2),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               fontFamily: 'Poppins'),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment(-0.75, -0.45),
//                         child: Text(
//                           "Orders to Deliver",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontFamily: 'Poppins'),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment(-0.96, -0.5),
//                         child: Text(
//                           "10",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontFamily: 'Poppins'),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment(-0.75, -0.15),
//                         child: Text(
//                           "Pending Orders ",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontFamily: 'Poppins'),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment(-0.92, -0.15),
//                         child: Text(
//                           "5 ",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontFamily: 'Poppins'),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment(0.98, -0.9),
//                         child: Text(
//                           "Latest Designs",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 9.0,
//                               fontFamily: 'Poppins'),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment(-0.9, 0.55),
//                         child: Text(
//                           "₹ 32,400",
//                           style: TextStyle(
//                               color: Color.fromRGBO(3, 43, 119, 10),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20.0,
//                               fontFamily: 'Poppins'),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment(-0.9, 0.85),
//                         child: Text(
//                           "Receivable Today",
//                           style: TextStyle(
//                               color: Color.fromRGBO(3, 43, 119, 10),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12.0,
//                               fontFamily: 'Poppins'),
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage("assets/images/Orders List.png"),
//                             alignment: Alignment(0.98, -0.7),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//             Text(
//               "Today's Customer",
//               style: TextStyle(fontSize: 19.0, fontFamily: 'Productsans', color: Colors.black87),
//               overflow: TextOverflow.clip,
//               textAlign: TextAlign.center,
//             ),
//             Text(
//               'View All',
//               style: TextStyle(
//                 fontSize: 16.0,
//                 fontFamily: 'Productsans',
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromRGBO(3, 49, 119, 10),
//               ),
//             ),
//           ]),
//           Todaycustomers(),
//           Container(
//             height: 1,
//             color: Colors.white,
//           ),
//           Container(
//             color: Colors.red,
//             height: MediaQuery.of(context).size.height * 0.5,
//             child:
//             Tabview(),
//           )
//         ],
//       ),
//       bottomNavigationBar: BottomNavDesignUpdated(),
//      // bottomNavigationBar: BottomNavigation(),
//     );
//   }
// }
