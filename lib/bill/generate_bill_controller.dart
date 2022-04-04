import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/api/create_order/create_order_model.dart';
import 'package:quikieappps1/blouse/design/select_design/select_design_controller.dart';
import 'package:quikieappps1/blouse/measurement/measurement_controller.dart';
import 'package:quikieappps1/blouse/place_order/place_order_controller.dart';
import 'package:quikieappps1/blouse/preview_order/previewOrder_blouse_controller.dart';
import 'package:quikieappps1/customer/add_customer/add_customer_controller.dart';

class GenerateBillController extends ChangeNotifier {
  double amount = 0.0;
  TextEditingController controller = TextEditingController();
  double remaining = 0.0;
  CreateOrder createOrder = CreateOrder();
  List<OrderList> orderList = <OrderList>[];
  Map<String, File> files = {};

  double calculateAmount() {
    if (controller.text.isNotEmpty) {
      var value = amount - double.parse(controller.text);
      remaining = value;
      return remaining;
    }
    return 0;
  }

  Future<void> createData(BuildContext context) async {
    var addCustomer = Provider.of<AddCustomerController>(context, listen: false);
    var placeOrder = Provider.of<PlaceOrderController>(context, listen: false);
    var selectDesign = Provider.of<BlouseSelectDesignController>(context, listen: false);
    var previewOrder = Provider.of<PreviewOrderBlouseController>(context, listen: false);
    var measurement = Provider.of<MeasurementController>(context, listen: false);
    createOrder.customerName = addCustomer.addCustomerModel!.data!.attributes.name;
    createOrder.customerId = addCustomer.addCustomerModel!.data!.id;
    createOrder.balancePayment = remaining.toString();
    createOrder.grandTotalPayment = placeOrder.grandTotalAmount.toString();
    createOrder.automaticBillCompletion = false;
    createOrder.manualBillCompletion = false;
    createOrder.adavancePayment = controller.text;
    createOrder.orderDate = DateTime.now().toString();
    createOrder.dueDate = placeOrder.selectedValue.toString();
    createOrder.invoiceNumber = int.parse(placeOrder.invoiceNumber!.data!.attributes!.nextInvoiceNumberSuggestion!);

    // for (var i = 0; i < orderList.length; i++) {
    //   orderList[i].frontImageUrl = selectDesign.frontImageUrl ?? '';
    //   orderList[i].backImageUrl = selectDesign.backImageUrl ?? '';
    //   orderList[i].sleevesImageUrl = selectDesign.sleevesImageUrl ?? '';
    //   orderList[i].price = placeOrder.grandTotalAmount.toString();
    //   orderList[i].quantity = placeOrder.quantity;
    //   orderList[i].productName = 'Blouse 2';
    //   orderList[i].productType = 'blouse';
    //   orderList[i].cups = previewOrder.status[i];
    //   orderList[i].hooks = previewOrder.status[i];
    //   orderList[i].piping = previewOrder.status[i];
    //   orderList[i].zipType = previewOrder.status[i];
    //   orderList[i].armholeRound = measurement.data.entries.where((element) => element.key == 'armholeRound').toString();
    // }

    createOrder.orderList = [
      OrderList(
          productType: "blouse",
          productName: "Blouse 2",
          price: "2000",
          quantity: 1,
          fullLength: "14",
          shoulder: "14",
          shoulderGap: "14",
          sleevesLength: "14",
          armholeRound: "14",
          circleDownLoose: "14",
          sleevesRound: "14",
          upperChestRound: "14",
          chestRound: "14",
          lowerChestRound: "14",
          waistRound: "14",
          firstDartPoint: "14",
          secondDartPoint: "14",
          bustPoint: "14",
          frontNeckDeep: "14",
          backNeckDeep: "14",
          waistBandLength: "14",
          neckWidth: "14",
          backNeckWidth: "14",
          orderCompletion: false,
          frontImageUrl: "100",
          backImageUrl: "",
          sleevesImageUrl: "102",
          hangingsImageUrl: "104",
          cups: false,
          piping: true,
          zipType: "Front",
          hooks: "Back")
    ];
    notifyListeners();
  }
}
