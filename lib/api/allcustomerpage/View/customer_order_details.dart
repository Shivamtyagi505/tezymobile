import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/api/allcustomerpage/Controller/customer_details_controller.dart';

// ignore: must_be_immutable
class CustomerOrderDetails extends StatefulWidget {
  String? name;
  int? id;
  String? lastOrder;
//  final String img;
  CustomerOrderDetails({required this.name, required this.id, required this.lastOrder});
  @override
  _CustomerOrderDetailsState createState() => _CustomerOrderDetailsState();
}

class _CustomerOrderDetailsState extends State<CustomerOrderDetails> {
  @override
  void initState() {
    var provider = Provider.of<CustomerDetailsController>(context, listen: false);
    provider.fetchCustomerBillsData(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool checkedValue = true;
    return Scaffold(
      body: Consumer<CustomerDetailsController>(builder: (context, value, child) {
        return value.billCustomerModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Color(0xff032B77),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(top: height*0.02),
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  // SizedBox(width: width*0.1,),
                                ],
                              ),
                              //SizedBox(height: height*0.02,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          'assets/images/customer2.png',
                                          height: height * 0.1,
                                        )),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      widget.name.toString(),
                                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "+91 99999 99999",
                                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              //SizedBox(height: ,),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffEDF1F5),
                            // borderRadius: BorderRadius.vertical(
                            //   top: Radius.circular(35.0),
                            // ),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'ALL BILLS',
                                    style: TextStyle(color: Color(0xff032B77), fontWeight: FontWeight.bold),
                                  )),
                              (value.billCustomerModel!.data!.isEmpty)
                                  ? Container(
                                      margin: EdgeInsets.only(top: 200),
                                      child: Text(
                                        'No Bills For This Customer !!',
                                        style: TextStyle(
                                            color: Color(0xff032B77), fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: value.billCustomerModel!.data!.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        var data = value.billCustomerModel!.data![index].attributes;
                                        return Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          child: Container(
                                            height: height * 0.13,
                                            width: width,
                                            child: Card(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                              color: Colors.white,
                                              shadowColor: Colors.grey,
                                              child: Row(
                                                children: [
                                                  Image.asset('assets/images/Rectangle 524.png'),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text(
                                                        data?.customerName ?? '',
                                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            data?.grandTotalPayment ?? '',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xff1170DE),
                                                                fontSize: 14),
                                                          ),
                                                          Text(
                                                            '/ Bill Amount',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 12,
                                                                color: Color(0xff979797)),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        'BILL NO: ${data?.invoiceNumber ?? ''}',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 12,
                                                            color: Color(0xff1170DE)),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'Due',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 10,
                                                            color: Color(0xff979797)),
                                                      ),
                                                      Text(
                                                        data?.dueDate!.substring(0, 15) ?? '',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Completed",
                                                            style: TextStyle(
                                                                color: Color.fromRGBO(17, 112, 222, 1),
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w600),
                                                          ),
                                                          Checkbox(
                                                              focusColor: Color(0xff1170DE),
                                                              activeColor: Color(0xff1170DE),
                                                              shape: CircleBorder(),
                                                              value: checkedValue,
                                                              onChanged: (newValue) {
                                                                setState(() {
                                                                  checkedValue = newValue!;
                                                                });
                                                              }),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
