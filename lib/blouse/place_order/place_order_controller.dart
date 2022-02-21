import 'package:flutter/cupertino.dart';
import 'package:quikieappps1/api/place_order/invoice_number_model.dart';
import 'package:quikieappps1/api/place_order/place_order_services.dart';

class PlaceOrderController extends ChangeNotifier{

  InvoiceNumber? invoiceNumber;


  Future<void> fetchInvoiceNumberSuggestions() async {
    invoiceNumber = await getInvoiceNumberSuggestion();
    notifyListeners();
  }
}