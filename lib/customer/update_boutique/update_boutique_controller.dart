import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quikieappps1/api/boutique_profile/profile_model.dart';
import 'package:quikieappps1/api/update_boutique_details/update_boutique_services.dart';
import 'package:quikieappps1/blouse/design/select_design/select_front_design.dart';
import 'package:quikieappps1/util/custom_message.dart';

import '../../api/boutique_profile/profile_services.dart';

class UpdateBoutiqueController extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  ProfileImage? profileImage;
  final picker = ImagePicker();
  File? _profileImage;
  DesignImage? profileDesignImage = DesignImage();

  Future<void> callUpdateBoutique() async {
    try {
      var result = await updateBoutiqueDetails(UpdateBoutiqueData(
          userName: usernameController.text,
          email: emailController.text,
          password: passwordController.text,
          mobileNumber: mobileController.text,
          address: addressController.text));
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

  Future<void> fetchProfileImage() async {
    profileImage = await getProfileImage();
    notifyListeners();
  }

  Future<void> updateProfileImageData() async {
    // await updateProfileImage();
    notifyListeners();
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Update Profile Image'),
                      onTap: () async {
                        showCameraPicker(context);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.close),
                    title: new Text('Remove Profile Image'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showCameraPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        imgFromGalleryProfile();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCameraProfile();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future imgFromCameraProfile() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) _profileImage = File(pickedFile.path);
    profileDesignImage!.image = _profileImage;
    profileDesignImage!.type = 'Camera';
    await updateProfileImage(profileDesignImage!.image);
    await fetchProfileImage();
    notifyListeners();
  }

  Future imgFromGalleryProfile() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) _profileImage = File(pickedFile.path);
    profileDesignImage!.image = _profileImage;
    profileDesignImage!.type = 'Gallery';
    notifyListeners();
  }
}
