import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:quikieappps1/api/add_customer/add_customer_services.dart';
import 'package:quikieappps1/api/add_customer/all_customer_model.dart';
import 'package:quikieappps1/api/allcustomerpage/Controller/customer_services.dart';
import 'package:quikieappps1/api/allcustomerpage/Model/customers_model.dart';
import 'package:quikieappps1/orders/Model/orders_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectCustomerController extends ChangeNotifier {
  AllCustomerModel? allCustomerModelItems;
  List<TotalBill>? filteredAllCustomerModel;
  AllCustomerAttributes? allCustomerAttributes;
  String? username = '';
  var formatter = new DateFormat('yyyy-MM-dd');
  OrdersModel? ordersModel;
  AllCustomers? customer;
  int? customerId;

  Future<void> fetchAllCustomerApi() async {
    try {
      var result = await getCustomerApi();
      allCustomerModelItems = result;
      if (allCustomerModelItems!.data != null) {
        var filter = allCustomerModelItems!.data!
            .where((element) => ordersModel!.data.attributes.totalProducts[0].id == element.id)
            .toList();
        filteredAllCustomerModel = filter.cast<TotalBill>();
      }
      notifyListeners();
    } catch (e) {
      Exception('Unable to fetch customers');
    }
  }

  Future<void> customerModelData() async {
    customer = await allCustomerModel();
    notifyListeners();
  }

  getShopUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.get('username').toString();
    username = value;
    notifyListeners();
  }

  getCustomerData(AllCustomerAttributes allCustomerAttribute, int id) {
    allCustomerAttributes = allCustomerAttribute;
    customerId = id;
  }
}
