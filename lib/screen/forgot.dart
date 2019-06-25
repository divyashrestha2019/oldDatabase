import 'package:flutter/material.dart';
import 'package:database/layout/constant.dart';

class ForgotScreen extends StatefulWidget {
  static const String id = 'forgot_screen';
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  String email;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepOrange[50],
      body: SingleChildScrollView(
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
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WOW',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 30.0,
                          ),
                        ),
                        Text('DealMaster',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 30.0,
                          ),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80.0,
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
                height: 30.0,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                        textColor: Colors.white,
                        color: Colors.teal[900],
                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        child: Text('Send Password Reset Link'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
