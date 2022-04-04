import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quikieappps1/api/add_customer/add_customer_model.dart';
import 'package:quikieappps1/api/add_customer/add_customer_services.dart';
import 'package:quikieappps1/api/datafromfrontend/add_customer_class.dart';
import 'package:quikieappps1/util/custom_message.dart';

class AddCustomerController extends ChangeNotifier {
  AddCustomerModel? addCustomerModel;
  AddCustomerModel? getAllCustomer;
  var nameController = TextEditingController();
  var mobileController = TextEditingController();

  Future<void> fetchAddCustomer(BuildContext context) async {
    try {
      var result = await addCustomerApi(AddCustomerData(name: nameController.text, mobile: mobileController.text));
      addCustomerModel = result;
      if (addCustomerModel!.data != null) {
        CustomMessage.toast('Custom Added Successfully!!');
        Navigator.pop(context);
        //Navigator.push(context, MaterialPageRoute(builder: (context) => input_sample()));
        notifyListeners();
      }
    } catch (e) {
      Exception('Unable to add customer');
      CustomMessage.toast('Unable to add customer');
    }
  }
}
