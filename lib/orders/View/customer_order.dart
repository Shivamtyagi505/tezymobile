import 'package:flutter/material.dart';
import 'customer_order_details.dart';

class CustomerOrder extends StatefulWidget {

  @override
  _CustomerOrderState createState() => _CustomerOrderState();
}

class _CustomerOrderState extends State<CustomerOrder> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff032B77),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: height*0.06),
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                        Padding(
                          padding: EdgeInsets.only(right: 60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "BOUTIQUE NAME",
                                style:
                                TextStyle(fontSize: 25, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 7), // changes position of shadow
                              ),
                            ],
                            color: Colors.white),
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Search",
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffEDF1F5),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35.0),
                  ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text('ALL CUSTOMERS',style: TextStyle(color: Color(0xff032B77),fontWeight: FontWeight.bold),)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerOrderDetails()));
                        },
                        child: Container(
                          height: height*0.13,
                          width: width,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            color: Colors.white,
                            shadowColor: Colors.grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset('assets/images/customer2.png'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('SHRUTHI',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                                    Text('Customer Name',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Color(0xff979797)),),
                                    Text('Total Bill: 36',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Color(0xff1170DE)),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Due',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10,color: Color(0xff979797)),),
                                    Text('12 Sep 2021',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,),),
                                    Text('View',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Color(0xff1170DE)),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerOrderDetails()));
                        },
                        child: Container(
                          height: height*0.13,
                          width: width,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            color: Colors.white,
                            shadowColor: Colors.grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset('assets/images/customer1.png'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('KAVYA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                                    Text('Customer Name',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Color(0xff979797)),),
                                    Text('Total Bill: 36',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Color(0xff1170DE)),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Due',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10,color: Color(0xff979797)),),
                                    Text('12 Sep 2021',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,),),
                                    Text('View',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Color(0xff1170DE)),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
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
