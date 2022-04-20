import 'package:flutter/foundation.dart';
import 'package:quikieappps1/api/boutique_profile/profile_model.dart';
import 'package:quikieappps1/api/boutique_profile/profile_services.dart';

class BlouseReviewController extends ChangeNotifier {
  ProfileImage? profileImage;

  Future<void> fetchProfileImage() async {
    profileImage = await getProfileImage();
    notifyListeners();
  }
}
