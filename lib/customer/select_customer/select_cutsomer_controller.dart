import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:quikieappps1/api/add_customer/add_customer_services.dart';
import 'package:quikieappps1/api/add_customer/all_customer_model.dart';
import 'package:quikieappps1/orders/Model/orders_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectCustomerController extends ChangeNotifier {
  AllCustomerModel? allCustomerModel;
  List<TotalBill>? filteredAllCustomerModel;
  String? username = '';
  var formatter = new DateFormat('yyyy-MM-dd');
  OrdersModel? ordersModel;

  // String dateFormat() {
  //   var date = DateTime.now();
  //   var formatDate = DateFormat('EEE, dd MMM').format(date);
  //   return formatDate;
  // }

  Future<void> fetchAllCustomerApi() async {
    try {
      var result = await getCustomerApi();
      allCustomerModel = result;
      if (allCustomerModel!.data != null) {
        var filter = allCustomerModel!.data!
            .where((element) =>  ordersModel!.data.attributes.totalProducts[0].id == element.id)
            .toList();
        filteredAllCustomerModel = filter.cast<TotalBill>();
        //print(filteredAllCustomerModel);
      }
      notifyListeners();
    } catch (e) {
      Exception('Unable to fetch customers');
    }
  }

    getShopUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.get('username').toString();
    username = value;
    notifyListeners();
  }

}
