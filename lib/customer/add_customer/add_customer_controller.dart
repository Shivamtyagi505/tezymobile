// import 'package:flutter/cupertino.dart';
// import 'package:quikieappps1/api/add_customer/add_customer_model.dart';
// import 'package:quikieappps1/api/add_customer/add_customer_services.dart';
// import 'package:quikieappps1/api/datafromfrontend/add_customer_class.dart';

// class AddCustomerController extends ChangeNotifier {
//   List<AddCustomerModel> addCustomerModel = [];
//   var nameController = TextEditingController();
//   var mobileController = TextEditingController();


//   Future<void> fetchAddCustomer() async {
//     try {
//       var result = await addCustomerApi(AddCustomerData(name: nameController.text, mobile: mobileController.text));
//       print(result);
//       addCustomerModel = result;
//     } catch (e) {
//       Exception('Unable to add customer');
//     }
//   }
// }
