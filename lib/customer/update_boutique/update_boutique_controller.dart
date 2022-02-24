import 'package:flutter/cupertino.dart';
import 'package:quikieappps1/api/update_boutique_details/update_boutique_services.dart';
import 'package:quikieappps1/util/custom_message.dart';

class UpdateBoutiqueController extends ChangeNotifier{
 TextEditingController usernameController = TextEditingController();
 TextEditingController emailController = TextEditingController();
 TextEditingController mobileController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
 TextEditingController addressController = TextEditingController();


 Future<void> callUpdateBoutique() async {
    try {
      var result = await updateBoutiqueDetails(UpdateBoutiqueData(userName: usernameController.text,email: emailController.text,password: passwordController.text,mobileNumber: mobileController.text,address: addressController.text)) ;
      if (result != null) {
        CustomMessage.toast('Boutique Details Updated Successfully!!');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => input_sample()));
        notifyListeners();
      }
    } catch (e) {
      Exception('Unable to Update Boutique Details');
      CustomMessage.toast('Unable to Update Boutique Details');
    }
  }
}

