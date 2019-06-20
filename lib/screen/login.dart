import 'package:flutter/material.dart';
import 'package:database/layout/rounded_button.dart';
import 'package:database/layout/constant.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:database/screen/forgot.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String email;
  String password;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Delta',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 30.0,
                        ),
                      ),
                      Text('SalesCRM',
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 30.0,
                        ),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith( hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password.'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child:Checkbox(
                        value: isChecked,
                        tristate: true,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                        activeColor: Color(0xff06bbfb),
                      ),
                    ),
                    FlatButton(onPressed: null,
                        child: Text('remember me',style: TextStyle(color: Colors.purple),),
                    ),
                    Column(
                      children: <Widget>[
                        FlatButton(onPressed: () {
                          Navigator.pushNamed(context, ForgotScreen.id);
                        },
                            child: Text('Forget Password',style: TextStyle(color: Colors.red[200], ),
                            )),
                      ],
                    )
                  ],
                ),
                RoundedButton(
                  title: 'Login',
                  colour: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, ForgotScreen.id);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

