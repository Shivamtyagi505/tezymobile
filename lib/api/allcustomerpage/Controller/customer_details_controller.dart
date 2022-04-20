import 'package:flutter/material.dart';
import 'package:quikieappps1/api/allcustomerpage/Controller/customer_services.dart';
import 'package:quikieappps1/api/allcustomerpage/Model/bill_customer_model.dart';

class CustomerDetailsController extends ChangeNotifier {
  BillCustomerModel? billCustomerModel;

  Future<void> fetchCustomerBillsData(var customerId) async {
    billCustomerModel = await getCustomerBills(customerId);
    notifyListeners();
  }
}
