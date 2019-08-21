import 'package:flutter/material.dart';
import 'package:database/screen/dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Reset.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  static String id = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  bool isLoading = false;
  bool rememberMe = false;
  bool passwordVisible;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
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

  Future<List> _login() async {
    final response =
        await http.post("http://leadmgmtv2.deltatech.com.np/api/login", body: {
      "email":  _emailController.text,
      "password":  _passwordController.text
    });

    print("Login Response" + response.body);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      String token = (body["success"]["token"].toString().trim());
      SharedPreferences _sharedPreferences =await SharedPreferences.getInstance();
      _sharedPreferences.setString("token", token);
      _hideLoading();
      Navigator.pushNamed(context, DashBoard.id);

    } else {
      _hideLoading();
      final snackBar = SnackBar(
          backgroundColor: Colors.red, content: Text("Something went wrong"));
      _scaffold.currentState.showSnackBar(snackBar);
    }
  }

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: "hero",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300,
            height: 80,
            child: Image.asset('images/delta.png'),
          ),
        ],
      ),
    );
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
     // initialValue: "acharya.deltatech@gmail.com",
       controller: _emailController,
      decoration: InputDecoration(
        hintText: 'admin@gmail.com',
        labelText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        prefixIcon: Padding(
          padding: EdgeInsets.all(0.0),
          child: Icon(
            Icons.email,
            color: Colors.teal,
          ), // Icon is 48px widget
        ),
      ),
    );
    final password = TextFormField(
      autofocus: false,
      obscureText: passwordVisible,
        controller: _passwordController,
      validator: validatePassword,
      decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.lock,
              color: Colors.teal,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility_off : Icons.visibility,
              color: Colors.teal,
            ),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          )),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          // Validate Form
          _validateInputs();
        },
        padding: EdgeInsets.all(12),
        color: Colors.teal,
        child: Text('Sign In',
            style: TextStyle(color: Colors.white, fontSize: 18.0)),
      ),
    );

    return Stack(
      // <-- STACK AS THE SCAFFOLD PARENT
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
        Scaffold(
          key: _scaffold,
          backgroundColor: Colors.transparent,
          body: Center(
            // padding: EdgeInsets.all(8.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                children: [
                  logo,
                  email,
                  SizedBox(height: 8.0),
                  password,
                  // SizedBox(height: 10.0),
                  new Container(
                    alignment: FractionalOffset.center,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Checkbox(
                          value: rememberMe,
                          activeColor: Colors.teal,
                          onChanged: (bool value) {
                            setState(() {
                              rememberMe = value;
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Text("Remember Me"),
                        ),
                        new FlatButton(
                          child: Text("Forget Password?"),
                          textColor: Colors.red,
                          onPressed: () {
                            Navigator.pushNamed(context, Reset.id);
                          },
                        )
                      ],
                    ),
                  ),
                  //  SizedBox(height: 1.0),
                  _showCircularProgress(),
                  loginButton,
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
      _login();
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
} // Class Closing

String validatePassword(String value) {
  if (value.isEmpty) {
    return 'Please Enter Password';
  } else {
    return null;
  }
}
