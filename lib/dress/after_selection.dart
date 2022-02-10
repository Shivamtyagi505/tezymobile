import 'package:flutter/material.dart';
import 'package:quikieappps1/assets/colors.dart';
import 'package:quikieappps1/dress/dress_measurement.dart';



class After_Selection_image extends StatefulWidget {
  @override
  After_Selection_imageState createState() => After_Selection_imageState();
}

class After_Selection_imageState extends State<After_Selection_image> {
  Widget designSmall(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => After_Selection_image()));
          },
          child:
          Container(
            height: 195,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: darkGrey),
          ),),
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 5, bottom: 10),
          child: Text(text, style: TextStyle(fontSize: 10)),
        )
      ],
    );
  }
  Widget design(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => After_Selection_image()));
          },
          child:Container(
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: darkGrey),
          ),),
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

  int? _index;


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(elevation: 0.0,
          backgroundColor:Color.fromRGBO(60,60,61,10),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () { Navigator.pop(context, true);},
          ),),
        body: Container(
          child:SingleChildScrollView(child:
          Column(
              children:[
                Container(height: height * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(60,60,61,10),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(35.0),
                    ),
                  ),),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(15.0),
                      ),
                    ),
                    width: width * 0.8,
                    height: height * 0.1,
                    child:Column(
                      children: [
                        Text('V Neck With Dress Design',style: TextStyle(fontWeight: FontWeight.w500,fontFamily:'Poppins',fontSize: 18),),
                        SizedBox(height: 6,),
                        Align(alignment: Alignment.center,
                          child: RaisedButton(    textColor: Colors.white,    color: Color.fromRGBO(3,43,119,10),    child: Text("Search",style: TextStyle(fontWeight: FontWeight.bold),),    onPressed: () {},
                            shape: new RoundedRectangleBorder(      borderRadius: new BorderRadius.circular(28.0),    ),  ),),
                        SizedBox(height: 3,),
                        Text('Select Design to Stitch Order',style: TextStyle(fontWeight: FontWeight.w400,fontFamily:'Poppins',fontSize: 12,color: Color.fromRGBO(122,122,122,10)),),

                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child:InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => After_Selection_image()));
                          },

                          child:Column(
                            children: [
                              design("Scrlet Blouse Design"),
                              design("Scrlet Blouse Design"),
                              design("Scrlet Blouse Design")
                            ],
                          ),),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                          child:InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => After_Selection_image()));
                            },


                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                designSmall("Scrlet Blouse Design"),
                                design("Scrlet Blouse Design"),
                                design("Scrlet Blouse Design"),
                                SizedBox(height: 50)
                              ],
                            ),
                          )),
                    ],
                  ),
                )
              ]
          )
          ),),
        bottomNavigationBar: BottomNavigationBar(

          backgroundColor: Colors.white,
          selectedItemColor: Color.fromRGBO(69, 89, 210, 10),
          unselectedItemColor: Colors.black54,
          onTap: (int val) {
            setState(

                    () {
                  _index = val;
                });

            if (val == 0) {

            }
            if (val == 1) {



            }


          },
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                title: Text(''),
                icon: Image.asset('assets/images/Previous.png')),



            BottomNavigationBarItem(
              icon: Image.asset('assets/images/Group 416.png'),
              title: Text(''),

            ),


            //FloatingNavbarItem(icon: Icons.help_outline_rounded, title: 'Help Desk'),


          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 50),

            child:
            Column(mainAxisAlignment: MainAxisAlignment.end,
                children:[ FloatingActionButton(
                  backgroundColor: Color.fromRGBO(3,43,119,10),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Icon(Icons.add,color: Colors.white,),
                ),
                  Text("Upload Your Photo")


                ]))


    );





  }}
