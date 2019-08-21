import 'package:flutter/material.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PasswordReset extends StatefulWidget {
  static const String id = "password_reset_sceen";
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  bool isLoading = false;
  String _email; String _token;

  @override

  void initState() {
    super.initState();
    _getPreferences();
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

  _getPreferences() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _email = _sharedPreferences.getString('email');
      _token = _sharedPreferences.getString('token');
    });
  }

  _lostPreferences() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.remove('email');
    _sharedPreferences.remove('token');
  }

  TextEditingController _newController = new TextEditingController();
  TextEditingController _confirmController = new TextEditingController();

  Future<List> _confirm() async {
    final response =
    await http.post("http://leadmgmtv2.deltatech.com.np/api/password/reset-password", body: {
      "email":  _email,
      "otp": _token,
      "password": _newController.text,
      "password_confirmation":  _confirmController.text,
    });

    print("Login Response" + response.body);

    if (response.statusCode == 200) {
      _lostPreferences();
      _hideLoading();
      Navigator.pushNamed(context, LoginPage.id);
      final snackBar = SnackBar(
          backgroundColor: Colors.blue, content: Text("Login with your new password"));
      _scaffold.currentState.showSnackBar(snackBar);
    }

     else {
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
    final newPassword = TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.left,
      controller: _newController,
      validator: (value) {
        if(value.isEmpty) {
          return 'Please Inter New Password';
        } else
          return null;
      },
      decoration:InputDecoration(
        hintText: 'New Password',
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
    final confirmPassword = TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.left,
      controller: _confirmController,
      validator: (value) {
        if(value.isEmpty) {
          return 'Please Inter Confirm Password';
        } else
          return null;
      },
      decoration:InputDecoration(
        hintText: 'Confirm Password',
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
    final resetButton = Container(
      height: 65.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Center(child: Text('Reset Password',style: TextStyle(color: Colors.white),)),
          onPressed: (){
            _validateInputs();
          },
          color: Color(0xff108F87),

        ),
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
                padding: const EdgeInsets.only(left:20.0,right: 20.0),
                shrinkWrap: true,
                children: [
                  Container(
                    height: 70.0,
                  ),
                  logo,
                  _showCircularProgress(),
                  newPassword,
                  SizedBox(height: 5.0,),
                  confirmPassword,
                  resetButton,
                  Container(
                    height: 245.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
                        colors: [Colors.white70, const Color(0xFFA4DBE3), Colors.blueGrey], // whitish to gray
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset('images/male.png',width: 160.0,),
                        Image.asset('images/female.png',width: 160.0,),
                      ],
                    ),
                  ),
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
      if(_newController.text ==_confirmController.text) {
        _confirm();
      }
      else{
        final snackBar = SnackBar(
            backgroundColor: Colors.red, content: Text("Password did not match"));
        _scaffold.currentState.showSnackBar(snackBar);
        _hideLoading();
      }
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
