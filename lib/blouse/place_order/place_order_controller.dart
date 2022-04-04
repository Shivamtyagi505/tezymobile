import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:quikieappps1/api/place_order/invoice_number_model.dart';
import 'package:quikieappps1/api/place_order/place_order_services.dart';

import '../../util/custom_datePicker/date_picker_timeline.dart';

class PlaceOrderController extends ChangeNotifier {
  InvoiceNumber? invoiceNumber;
  String dropdownValue = '';
  var month;
  int quantity = 0;
  int newContainer = 0;
  TextEditingController textEditingController = TextEditingController();
  DatePickerController controller = DatePickerController();
  DateTime selectedValue = DateTime.now();

  Future<void> fetchInvoiceNumberSuggestions() async {
    invoiceNumber = await getInvoiceNumberSuggestion();
    notifyListeners();
  }

  void incrementCounter() {
    quantity++;
    notifyListeners();
  }

  void decrementCounter() {
    quantity--;
    notifyListeners();
  }

  updateMonth() {
    if (dropdownValue == 'Jan') {
      month = 1;
    } else if (dropdownValue == 'Feb') {
      month = 2;
    } else if (dropdownValue == 'Mar') {
      month = 3;
    } else if (dropdownValue == 'April') {
      month = 4;
    } else if (dropdownValue == 'May') {
      month = 5;
    } else if (dropdownValue == 'June') {
      month = 6;
    } else if (dropdownValue == 'July') {
      month = 7;
    } else if (dropdownValue == 'Aug') {
      month = 8;
    } else if (dropdownValue == 'Sept') {
      month = 9;
    } else if (dropdownValue == 'Oct') {
      month = 10;
    } else if (dropdownValue == 'Nov') {
      month = 11;
    } else if (dropdownValue == 'Dec') {
      month = 12;
    }
    print(month);
    notifyListeners();
  }

  getDate() {
    var dateString = DateTime.now();
    month = dateString.month;
    var formatDate = DateFormat('MMM').format(dateString);
    dropdownValue = formatDate;
    notifyListeners();
  }

  double? get grandTotalAmount {
    if (textEditingController.text.isEmpty) {
      return 0;
    } else {
      if (quantity == 0) {
        return double.parse(textEditingController.text);
      } else {
        if (newContainer == 0) {
          double value = double.parse(textEditingController.text) * quantity;
          return value;
        } else {
          double value = double.parse(textEditingController.text) * quantity;
          return value * (newContainer + 1);
        }
      }
    }
  }
}
