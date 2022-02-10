
import 'package:flutter/material.dart';
import 'package:overscroll_pop/overscroll_pop.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class After_Selection_image extends StatefulWidget {
  @override
  After_Selection_imageState createState() => After_Selection_imageState();
}

class After_Selection_imageState extends State<After_Selection_image> {
  int? _index;
  bool isSelected = false;
  final List<String> _listViewData = [
    'Front Design',
    'Back Design',
    'Sleeves Design',
  ];
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF4F8FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(60, 60, 61, 10),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () { Navigator.pop(context, false);},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            OverscrollPop(
              scrollToPopOption: ScrollToPopOption.both,
          dragToPopDirection: DragToPopDirection.toBottom,
              child: Container(
                height: height * 0.5,
                width: width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 60, 61, 10),
                ),
                child: Image.asset('assets/images/3d woman 1.png'),
              ),
            ),
            Container(
              height: height * 0.15,
              width: width,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'V Neck With Dress Design',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       InkWell(
                        onTap: ()async{
                          const url = "https://www.google.com/search?q=tailor+image&rlz=1C1ONGR_enIN946IN946&sxsrf=AOaemvI7SvR5oWL3plPP3pyGTvtaWCc_kQ:1638341754568&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiar7TSgsL0AhXVTWwGHaZ4CN0Q_AUoAXoECAIQAw&biw=1280&bih=569&dpr=1.5#imgrc=d5BKzXt5M8Z04M";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.05,
                          width: width * 0.2,
                          decoration: BoxDecoration(color: Color(0xff032B77), borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Visit',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: (){
                         Navigator.pop(context,isSelected);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.05,
                          width: width * 0.2,
                          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Select',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Select Design to Stitch Order',
                    style: TextStyle(color: Color(0xff979797), fontWeight: FontWeight.w400, fontSize: 12),
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
          ]),
        ),
      ),
   bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromRGBO(69, 89, 210, 10),
        unselectedItemColor: Colors.black54,
        onTap: (int val) {
          setState(() {
            _index = val;
          });

          if (val == 0) {
            
            // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: DailyLiaScreen()));
          }
          if (val == 1) {
           
            // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: MyHomePage()));
          }
        },
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(title: Text(''), icon: Image.asset('assets/images/Previous.png')),

          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Next1.png'),
            title: Text(''),
          ),

          //FloatingNavbarItem(icon: Icons.help_outline_rounded, title: 'Help Desk'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            FloatingActionButton(
              backgroundColor: Color.fromRGBO(3, 43, 119, 10),
              onPressed: () {
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            Text("Upload Your Photo")
          ])),
    );
  }


  Widget design(String text) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => After_Selection_image()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: darkGrey),
            child: Image.asset('assets/images/3d woman 1.png'),
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
      ),
    );
  }

  Widget designSmall(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 195,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: darkGrey),
          child: Image.asset('assets/images/3d woman 1.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 5, bottom: 10),
          child: Text(text, style: TextStyle(fontSize: 10)),
        )
      ],
    );
  }}