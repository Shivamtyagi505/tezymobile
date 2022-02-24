import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/blouse/design/select_design/select_design_controller.dart';
import 'package:quikieappps1/blouse/place_order/place_order_controller.dart';
import 'package:quikieappps1/blouse/preview_order/previewOrder_blouse_controller.dart';
import 'package:quikieappps1/customer/add_customer/add_customer_controller.dart';
import 'package:quikieappps1/customer/select_customer/select_cutsomer_controller.dart';
import 'package:quikieappps1/customer/update_boutique/update_boutique_controller.dart';
import 'package:quikieappps1/home/home_page/homepage_controller.dart';
import 'package:quikieappps1/login/login_page_controller.dart';
import 'package:quikieappps1/provider/measurement_provider.dart';
import 'package:quikieappps1/screens/hangings/hangings_controller.dart';
import 'package:quikieappps1/splash_screen/splash_screen.dart';
import 'blouse/pro_vider/image_notif.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (ctx) => MeasurementProvider()),
      ChangeNotifierProvider(create: (ctx) => HomepageController()),
      ChangeNotifierProvider(create: (ctx) => BlouseSelectDesignController()),
      ChangeNotifierProvider(create: (ctx) => AddCustomerController()),
      ChangeNotifierProvider(create: (ctx) => PreviewOrderBlouseController()),
      ChangeNotifierProvider(create: (ctx) => LoginController()),
      ChangeNotifierProvider(create: (ctx) => PlaceOrderController()),
      ChangeNotifierProvider(create: (ctx) => SelectCustomerController()),
      ChangeNotifierProvider(create: (ctx) => SelectHangingsController()),
      ChangeNotifierProvider(create: (ctx) => UpdateBoutiqueController()),
      ChangeNotifierProvider<ImageNotif>.value(
        value: ImageNotif(),
      ),
    ], child: PreLoginScree()));
  });
}

class PreLoginScree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "PreLoginScreeDesign",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.white,
          fontFamily: "Poppins",
          appBarTheme: AppBarTheme(
            shadowColor: Colors.blue,
            textTheme: TextTheme(
              headline1: TextStyle(
                  // fontFamily: "OpenSans",
                  ),
            ),
          ),
        ),
        home: SplashScreen(),
    );
  }
}
