import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/api/add_customer/add_customer_model.dart';
import 'package:quikieappps1/api/add_customer/add_customer_services.dart';
import 'package:quikieappps1/api/datafromfrontend/add_customer_class.dart';
import 'package:quikieappps1/blouse/input_sample.dart';
import 'package:quikieappps1/customer/add_customer/add_customer_controller.dart';
import 'package:quikieappps1/customer/selectcustomer.dart';
import 'package:quikieappps1/customer/updateboutiquedetails.dart';
import 'package:quikieappps1/util/validators.dart';

class AddCustomer extends StatefulWidget {
  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var nameController = TextEditingController();
  var mobileController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // var provider = Provider.of<AddCustomerController>(context, listen: false);
    //  provider.fetchAddCustomer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xFFE5F3FD),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top + 27, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Icon(Icons.arrow_back_ios),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Create New Customer",
                              style: TextStyle(fontSize: 25, color: Color(0xFF032B77)),
                            ),
                            Text("Add Customer"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(35.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(50),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff032B77),
                            border: Border.all(
                              color: Color.fromRGBO(3, 43, 119, 10),
                            ),
                          ),
                          child: Image.asset('assets/images/addcustomerprofile.png'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(27, 0, 24, 0),
                              child: Text(
                                "Customer Name",
                                style: TextStyle(
                                    color: Color(0xff032B77),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                                child: TextFormField(
                                  validator: (value) => validateNames(value),
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                      hintText: 'Enter Customer Name'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(27, 0, 24, 0),
                              child: Text(
                                "Mobile Number",
                                style: TextStyle(
                                    color: Color(0xff032B77),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 50),
                              child: TextFormField(
                                validator: (value) => validateMobile(value),
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                controller: mobileController,
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  hintText: 'Enter Customer Mobile Number',
                                ),
                              ),
                            ),
                          ],
                        ),
                        (_futureAddCustomerModel == null)
                            ? MaterialButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    fetchAddCustomerApi();
                                  }
                                  // value.fetchAddCustomer();
                                },
                                child: Text(
                                  "Add Customer",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins'),
                                ),
                                color: Color(0xff032B77),
                                minWidth: 283,
                                height: 54,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                              )
                            : buildAddCustomerFutureBuilder(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }

  Future<AddCustomerModel> _futureAddCustomerModel;
  void fetchAddCustomerApi() {
    String name = nameController.text;
    String mobile = mobileController.text;
    setState(() {
      _futureAddCustomerModel = addCustomerApi(AddCustomerData(name: name, mobile: mobile));
    });

    // print("email:  ${email} password: ${password} name: ${name}");
  }

  FutureBuilder<AddCustomerModel> buildAddCustomerFutureBuilder() {
    return FutureBuilder<AddCustomerModel>(
      future: _futureAddCustomerModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => input_sample()));
          });
        } else if (snapshot.hasError) {
          return Container(
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
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
