import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/customer/update_boutique/update_boutique_controller.dart';

class UpdateBoutiqueDetails extends StatefulWidget {
  @override
  UpdateBoutiqueDetailsDesign createState() => UpdateBoutiqueDetailsDesign();
}

class UpdateBoutiqueDetailsDesign extends State<UpdateBoutiqueDetails> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    var provider = Provider.of<UpdateBoutiqueController>(context, listen: false);
    provider.fetchProfileImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateBoutiqueController>(builder: (context, value, child) {
      return value.profileImage == null
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Color(0xFFE5F3FD),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top + 27, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Color(0xFF032B77),
                                    ))),
                            Padding(
                              padding: EdgeInsets.only(right: 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Boutique Detiles",
                                    style: TextStyle(fontSize: 25, color: Color(0xFF032B77)),
                                  ),
                                  Text("Add Customer"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35.0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  value.showPicker(context);
                                },
                                child: Stack(children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(15),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color.fromRGBO(3, 43, 119, 10),
                                        ),
                                        image: DecorationImage(
                                            image: new NetworkImage(
                                              'http://172.105.253.131:1337${value.profileImage!.data!.attributes!.boutiqueImage!.data!.attributes!.url!}',
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  Positioned(
                                    left: 85,
                                    top: 95,
                                    child: Container(
                                      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                      child: SvgPicture.asset('assets/images/plus.svg', color: Color(0xff280D78)),
                                    ),
                                  )
                                ]),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(27, 0, 24, 0),
                                    child: Text(
                                      "BOUTIQUE NAME",
                                      style: TextStyle(color: Color(0xFF032B77)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                                    child: TextField(
                                      controller: value.usernameController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          hintText: 'Enter Boutique Name'),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(27, 0, 24, 0),
                                    child: Text(
                                      "Password",
                                      style: TextStyle(color: Color(0xFF032B77)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                                    child: TextField(
                                      controller: value.passwordController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          hintText: 'Enter Password'),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(27, 0, 24, 0),
                                    child: Text(
                                      "Mobile Number",
                                      style: TextStyle(color: Color(0xFF032B77)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                                    child: TextField(
                                      controller: value.mobileController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          hintText: 'Enter Mobile Number'),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(27, 0, 24, 0),
                                    child: Text(
                                      "Address",
                                      style: TextStyle(color: Color(0xFF032B77)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                                    child: TextField(
                                      controller: value.addressController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          hintText: 'Enter Your Address'),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(27, 0, 24, 0),
                                    child: Text(
                                      "E-Mail",
                                      style: TextStyle(color: Color(0xFF032B77)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
                                    child: TextField(
                                      controller: value.emailController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          hintText: 'Enter E-Mail Address'),
                                    ),
                                  ),
                                ],
                              ),
                              MaterialButton(
                                onPressed: () {
                                  value.callUpdateBoutique();
                                },
                                child: Text(
                                  "Update Boutique Detiles",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Color(0xFF032B77),
                                minWidth: 283,
                                height: 50,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
