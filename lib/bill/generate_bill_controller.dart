import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/api/create_order/create_order_model.dart';
import 'package:quikieappps1/blouse/design/select_design/select_design_controller.dart';
import 'package:quikieappps1/blouse/measurement/measurement_controller.dart';
import 'package:quikieappps1/blouse/place_order/place_order_controller.dart';
import 'package:quikieappps1/blouse/preview_order/previewOrder_blouse_controller.dart';
import 'package:quikieappps1/customer/add_customer/add_customer_controller.dart';
import 'package:quikieappps1/customer/select_customer/select_cutsomer_controller.dart';
import 'package:quikieappps1/hangings/hangings_controller.dart';
import 'package:quikieappps1/home/home_page/homepage_controller.dart';

class GenerateBillController extends ChangeNotifier {
  double amount = 0.0;
  TextEditingController textController = TextEditingController();
  double remaining = 0.0;
  String orderType = '';
  CreateOrder createOrder = CreateOrder();
  List<OrderList> orderList = [];
  Map<String, File> files = {};
  String categorieName = '';
  List<double> totalAmount = [];

  double calculateAmount() {
    if (textController.text.isNotEmpty) {
      var value = amount - double.parse(textController.text);
      remaining = value;
      return remaining;
    }
    return 0;
  }

  Future<void> createData(BuildContext context) async {
    var addCustomer = Provider.of<SelectCustomerController>(context, listen: false);
    var placeOrder = Provider.of<PlaceOrderController>(context, listen: false);
    var selectDesign = Provider.of<BlouseSelectDesignController>(context, listen: false);
    var previewOrder = Provider.of<PreviewOrderBlouseController>(context, listen: false);
    var measurement = Provider.of<MeasurementController>(context, listen: false);
    var homePage = Provider.of<HomepageController>(context, listen: false);
    var hangings = Provider.of<SelectHangingsController>(context, listen: false);
    createOrder.customerName = addCustomer.username;
    // createOrder.customerId = addCustomer.customer.data.
    createOrder.balancePayment = remaining.toString();
    // createOrder.grandTotalPayment = placeOrder.grandTotalAmount.toString();
    createOrder.automaticBillCompletion = false;
    createOrder.manualBillCompletion = false;
    createOrder.adavancePayment = textController.text;
    createOrder.orderDate = DateTime.now().toString();
    createOrder.dueDate = placeOrder.selectedValue.toString();
    createOrder.invoiceNumber = int.parse(placeOrder.invoiceNumber!.data!.attributes!.nextInvoiceNumberSuggestion!);
    createOrder.orderList!.add(OrderList(
        productType: "blouse",
        productName: homePage.orderType,
        price: placeOrder.grandTotalAmount.toString(),
        quantity: placeOrder.quantity[0],
        fullLength: measurement.data?['Full Length'].toString() ?? '',
        shoulder: measurement.data?['Shoulder'].toString() ?? '',
        shoulderGap: measurement.data?['Shoulder Gap'].toString() ?? '',
        sleevesLength: measurement.data?['Shoulder'].toString() ?? '',
        armholeRound: measurement.data?['Armhole Round'].toString() ?? '',
        circleDownLoose: measurement.data?['Circle Down Loose'].toString() ?? '',
        sleevesRound: measurement.data?['Sleeves Round'].toString() ?? '',
        upperChestRound: measurement.data?['Upper Chest Round'].toString() ?? '',
        chestRound: measurement.data?['Chest Round'].toString() ?? '',
        lowerChestRound: measurement.data?['Lower Chest Round'].toString() ?? '',
        waistRound: measurement.data?['Waist Round'].toString() ?? '',
        firstDartPoint: measurement.data?['First Dart Point'].toString() ?? '',
        secondDartPoint: measurement.data?['Second Dart Point'].toString() ?? '',
        bustPoint: measurement.data?['Bust Point'].toString() ?? '',
        frontNeckDeep: measurement.data?['Front Neck Deep'].toString() ?? '',
        backNeckDeep: measurement.data?['Back Neck Deep'].toString() ?? '',
        waistBandLength: measurement.data?['Waist Band Length'].toString() ?? '',
        neckWidth: measurement.data?['Neck Width'].toString() ?? '',
        backNeckWidth: measurement.data?['Back Neck Width'].toString() ?? '',
        orderCompletion: false,
        frontImageUrl: selectDesign.frontImageUrl,
        backImageUrl: selectDesign.backImageUrl,
        sleevesImageUrl: selectDesign.sleevesImageUrl,
        hangingsImageUrl: hangings.hangingsDesignImage!.image,
        cups: placeOrder.cups,
        piping: placeOrder.pipings,
        zipType: placeOrder.zipType,
        hooks: placeOrder.hooks));
    notifyListeners();
  }

  void getCategorieName(BuildContext context) {
    var home = Provider.of<HomepageController>(context, listen: false);
    if (home.selectedIndex == 0) {
      categorieName = 'Blouse';
    } else if (home.selectedIndex == 1) {
      categorieName = 'Tops';
    } else if (home.selectedIndex == 2) {
      categorieName = 'Bottom';
    } else if (home.selectedIndex == 3) {
      categorieName = 'Others';
    }
  }

  void getOrderType(BuildContext context) {
    var home = Provider.of<HomepageController>(context, listen: false);
    orderType = home.orderType;
  }

  clearLocalData(BuildContext context) {
    var selectDesign = Provider.of<BlouseSelectDesignController>(context, listen: false);
    var previewOrder = Provider.of<PreviewOrderBlouseController>(context, listen: false);
    var selectHangings = Provider.of<SelectHangingsController>(context, listen: false);
    selectDesign.selectFrontDesignClass!.clear();
    selectDesign.selectBackDesignClass!.clear();
    selectDesign.selectSleeveDesignClass!.clear();
    selectDesign.frontDesignImage!.image = null;
    selectDesign.backDesignImage!.image = null;
    selectDesign.sleeveDesignImage!.image = null;
    previewOrder.image = null;
    previewOrder.status = [true, true, true, true];
    previewOrder.zipTypeLabel = 1;
    previewOrder.hooksLabel = 1;
    selectHangings.hangingsDesignImage!.image = null;
    notifyListeners();
  }
}
