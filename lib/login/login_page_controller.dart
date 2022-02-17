import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quikieappps1/api/datafromfrontend/login_data_class.dart';
import 'package:quikieappps1/api/login/login_model.dart';
import 'package:quikieappps1/api/login/login_services.dart';
import 'package:quikieappps1/home/bottomNavigation.dart';
import 'package:quikieappps1/util/custom_message.dart';
import 'package:quikieappps1/util/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  var emailIdController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  LoginModel? loginModel;

  Future<void> login(BuildContext context) async {
    String identifier = emailIdController.text;
    String password = passwordController.text;
    loginModel = await getLogin(LoginData(password: password, identifier: identifier));
    if (loginModel != null) {
      CustomMessage.toast('Login Successfully!!');
      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation()));

      SharedData().setUser(loginModel!.user!.id.toString());
      setJwt(loginModel!.jwt, loginModel!.user!.username);
    }
    notifyListeners();
  }

  void setJwt(jwt, name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('jwt', jwt);
    prefs.setString('username', name);
    notifyListeners();
  }
}
