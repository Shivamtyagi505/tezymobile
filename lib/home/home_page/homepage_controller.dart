import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:quikieappps1/api/add_customer/add_customer_services.dart';
import 'package:quikieappps1/api/add_customer/all_customer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageController extends ChangeNotifier {
  AllCustomerModel? allCustomerModel;
  List<AllCustomerData>? filteredAllCustomerModel;
  String? username = '';
  var formatter = new DateFormat('yyyy-MM-dd');

  String dateFormat() {
    var date = DateTime.now();
    var formatDate = DateFormat('EEE, dd MMM').format(date);
    return formatDate;
  }

  Future<void> fetchAllCustomer() async {
    try {
      var result = await getCustomerApi();
      allCustomerModel = result;
      if (allCustomerModel!.data != null) {
        var filter = allCustomerModel!.data!
            .where((element) => formatter.format(element.attributes!.createdAt!) == formatter.format(DateTime.now()))
            .toList();
        filteredAllCustomerModel = filter;
      }
      notifyListeners();
    } catch (e) {
      Exception('Unable to add customer');
    }
  }

    getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.get('username').toString();
    username = value;
    notifyListeners();
  }
}
