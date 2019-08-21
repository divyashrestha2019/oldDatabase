import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'reset_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Verification extends StatefulWidget {
  static const String id = "verification_sceen";
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  String code;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  @override
  void initState() {
    super.initState();
  }

  _showLoading() {
    setState(() {
      isLoading = true;
    });
  }
  _hideLoading() {
    setState(() {
      isLoading = false;
    });
  }

  TextEditingController _verificationController =TextEditingController();

  Future<List> _verify() async {
    final response =
    await http.post("http://leadmgmtv2.deltatech.com.np/api/password/check-otp", body: {
      "otp": _verificationController.text
    });

    print("Login Response" + response.body);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      String token = (body["data"]["token"].toString().trim());
      String email = (body["data"]["email"].toString().trim());

      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("token", token);
      sharedPreferences.setString("email", email);
      _hideLoading();
      Navigator.pushNamed(context, PasswordReset.id);

    } else {
      _hideLoading();
      final snackBar = SnackBar(
          backgroundColor: Colors.red, content: Text("Something went wrong"));
      _scaffold.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: "hero",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset('images/delta.png'),
            height: 100.0,
          ),
        ],
      ),
    );
    final verificationCode = TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.left,
      controller: _verificationController,
      validator: (value) {
        if(value.isEmpty) {
          return 'Please inter verification key';
        } else
          return null;
      },
      decoration: InputDecoration(
        hintText: 'Verification Code',
        hintStyle: TextStyle(color: Color(0xff959595)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff959595), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff959595), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        fillColor: Colors.teal,
      ),
    );
    final verifyButton = Padding(
      padding: const EdgeInsets.symmetric(vertical:20.0),
      child: RaisedButton(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Center(
            child: Text(
              'Verify',
              style: TextStyle(color: Colors.white),
            )),
        onPressed: () {
          _validateInputs();
        },
        color: Color(0xff108F87),
      ),
    );
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
        Scaffold(
          key: _scaffold,
          backgroundColor: Colors.transparent,
          body: Center(
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                children: [
                  Container(
                    height: 150.0,
                  ),
                  logo,
                  _showCircularProgress(),
                  verificationCode,
                  verifyButton,
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment
                            .bottomCenter, // 10% of the width, so there are ten blinds.
                        colors: [
                          Colors.white70,
                          const Color(0xFFA4DBE3),
                          Colors.blueGrey
                        ], // whitish to gray
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }


  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      // If all data are correct then save data to the variables
      _formKey.currentState.save();
      _showLoading();
      _verify();
    } else {
      // If all data are not valid then start auto validation
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Widget _showCircularProgress() {
    if (isLoading) {
      return Center(
          child: CircularProgressIndicator(backgroundColor: Colors.teal));
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
} //closing main class
