import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/userprovider.dart';
import 'package:kidsapp/screens/types.dart';
import 'package:kidsapp/widgets/background.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const String route = 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool login;
  bool hidepassword, hideconfirmpassword;
  String password, email;
  GlobalKey<FormState> form;
  FocusNode passwordnode;
  bool loading;
  GlobalKey<ScaffoldState> scaffold;
  bool firstrun;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    login = true;
    hidepassword = true;
    scaffold = GlobalKey<ScaffoldState>();
    hideconfirmpassword = true;
    form = GlobalKey<FormState>();
    passwordnode = FocusNode();
    loading = false;
    firstrun = true;
    _getUserLocation();
  }
   void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    Userprovider.city = first.adminArea;
    Userprovider.country = first.countryName;
    
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void validatetologin() async {
    if (form.currentState.validate()) {
      setState(() {
        loading = true;
      });
      String error = await Provider.of<Userprovider>(context, listen: false)
          .signInn(email, password);

      if (error != null) {
        scaffold.currentState.showSnackBar(SnackBar(
          content: Text('invalid email'),
          backgroundColor: Colors.red[600],
        ));
        setState(() {
          loading = false;
        });
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Types()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: Scaffold(
          key: scaffold,
          backgroundColor: Color.fromARGB(24, 178, 223, 9),
          body: Container(
            height: double.infinity,
            child: Stack(
              children: [
                Background(),
                SingleChildScrollView(
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.07),
                        child: Text(
                          'Kid Duas',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.white,
                                letterSpacing: .5,
                                fontWeight: FontWeight.bold,
                                fontSize: 73),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.07),
                          child: Image.asset('assets/images/Group 39.png'),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        child: Form(
                          key: form,
                          child: Column(
                            children: [
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 1.0, horizontal: 1.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  errorStyle:
                                      TextStyle(color: Colors.redAccent[900]),
                                  hintText: '  user name',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),

                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white),
                                    //   borderRadius: BorderRadius.all(),
                                  ),
                                ),
                                validator: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                  if (EmailValidator.validate(email)) {
                                    return null;
                                  }
                                  return 'invalid Email';
                                },
                                onFieldSubmitted: (value) {
                                  passwordnode.requestFocus();
                                },
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              TextFormField(
                                maxLines: 1,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 1.0, horizontal: 1.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  errorStyle:
                                      TextStyle(color: Colors.redAccent[900]),
                                  hintText: '  password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),

                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white),
                                    //   borderRadius: BorderRadius.all(),
                                  ),
                                ),
                                validator: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                  if (password.length >= 4) {
                                    return null;
                                  }
                                  return 'password must contain 8 charcter at least';
                                },
                                textInputAction: TextInputAction.done,
                                focusNode: passwordnode,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.05),
                                child: loading
                                    ? Center(child: CircularProgressIndicator())
                                    : Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2),
                                        height: 40,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                )),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white)),
                                            onPressed: () {
                                              validatetologin();
                                            },
                                            child: Text(
                                              'Login',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                      ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
