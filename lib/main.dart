import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quikieappps1/api/datafromfrontend/login_data_class.dart';
import 'package:quikieappps1/api/login/login_model.dart';
import 'package:quikieappps1/home/home_page/homepage_controller.dart';
import 'package:quikieappps1/provider/measurement_provider.dart';
import 'package:quikieappps1/screens/welcome1.dart';
import 'package:quikieappps1/splash_screen/splash_screen.dart';
import 'package:quikieappps1/util/shared_preferences.dart';
import 'package:quikieappps1/util/validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/login/login_services.dart';
import 'blouse/pro_vider/image_notif.dart';
import 'home/bottomNavigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (ctx) => MeasurementProvider()),
      ChangeNotifierProvider(create: (ctx) => HomepageController()),
      // ChangeNotifierProvider(create: (ctx) => AddCustomerController()),
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
        // home:  selectotherdesign(),
    );
  }
}

class PreLoginScreeDesign extends StatefulWidget {
  @override
  _PreLoginScreeDesignState createState() => _PreLoginScreeDesignState();
}

class _PreLoginScreeDesignState extends State<PreLoginScreeDesign> {
  final _formKey = GlobalKey<FormState>();
  var emailIdController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  /*
  * Global Instance of FocusNodes
  * */
  FocusNode emailIdFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode nameFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  //  height: height*0.5,
                  margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/Logo2.png',
                    fit: BoxFit.fitHeight,
                    height: 200,
                  ),
                ),
                Container(
                    // height:height*0.5 ,
                    margin: EdgeInsets.only(top: 240),
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(35.0),
                      ),
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: width,
                          height: 69,
                          child: Text(
                            "Tezy",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55, color: Color(0xFF02D3FF)),
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                          width: width,
                          child: Text(
                            "Login to your Account",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
                          )),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          // validator: (value) => validateEmail(value!),
                          controller: emailIdController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            labelText: 'Email',
                            hintText: 'Enter Email',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          // validator: (value) => validatePassword(value!),
                          focusNode: passwordFocusNode,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            labelText: 'Password',
                            hintText: 'Enter Password',
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              login();
                            }
                          },
                          child: _futureLoginModel == null
                              ? Container(
                                  height: 55,
                                  width: 296,
                                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                  decoration: const BoxDecoration(
                                    color: Color(0xff029EFF),
                                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Sign in',
                                        style: TextStyle(color: Colors.white, fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              : buildLoginFutureBuilder()),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => welcomeScreen1()));
                        },
                        child: Container(
                          height: 55,
                          width: 296,
                          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE5F3FD),
                            borderRadius: BorderRadius.all(Radius.circular(80.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/images/google 1.png',
                              ),
                              Text(
                                'Sign in with Google ',
                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      /*  InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => welcomeScreen1()));
      
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: width * 0.2,),
                          width: 296,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(80.0)),
                            color: Color(0xFFE5F3FD),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/google 1.png',
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => welcomeScreen2()),
                                    );
                                   */ /* Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomePage()),
                                    );*/ /*
                                  }, //do something,
                                ),
                              ),
                              Text(
                                'Sign in with Google ',
                                style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),*/
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => welcomeScreen1()));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: height * 0.001),
                          width: width,
                          height: height * 0.05,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text(
                              "Don’t have an account ?",
                              style: TextStyle(fontSize: 11, color: Color.fromRGBO(3, 43, 119, 10)),
                            ),
                            Text("Register !", style: TextStyle(fontSize: 11, color: Colors.redAccent)),
                          ]),
                        ),
                      ),
                    ])),
              ],
            ),
          ),
          //color: Colors.white,
        ),
      ),
    );
  }

   Future<LoginModel>? _futureLoginModel;
  void login() {
    String identifier = emailIdController.text;
    String password = passwordController.text;
    setState(() {
      _futureLoginModel = getLogin(LoginData(password: password, identifier: identifier));
    });
  }

  void setJwt(jwt, name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('jwt', jwt);
    prefs.setString('username', name);
  }

  FutureBuilder<LoginModel> buildLoginFutureBuilder() {
    return FutureBuilder<LoginModel>(
      future: _futureLoginModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            SharedData().setUser(snapshot.data!.user!.id.toString());
            setJwt(snapshot.data!.jwt, snapshot.data!.user!.username);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavigation(
                          name: snapshot.data!.user!.username!,
                        )));
          });
        } else if (snapshot.hasError) {
          return Container(
            height: 55,
            width: 296,
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xff029EFF),
              borderRadius: BorderRadius.all(Radius.circular(80.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
