import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'new_verify.dart';

class Reset extends StatefulWidget {
  static const String id = "reset_sceen";
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
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

  TextEditingController _emailController =TextEditingController();
  Future<List> _reset() async {
    final response = await http.post('http://leadmgmtv2.deltatech.com.np/api/password/send-reset-mail',body: {
      "email": _emailController.text
    });
    print("Server response" + response.body);
    _hideLoading();
    if(response.statusCode == 200)
      {
        Future.delayed(const Duration(milliseconds: 2000), () {
          final snackBar = SnackBar(
              backgroundColor: Colors.red, content: Text("GO AND CHECK THE EMAIL"));
          _scaffold.currentState.showSnackBar(snackBar);
        });
        Navigator.pushNamed(context, Verification.id);
      }
     //
    else {
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
    final resetLink =Container(height: 55,child:TextFormField(
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.left,
      controller: _emailController,
      validator: (value) {
        if(value.isEmpty) {
          return 'Please inter reset email';
        } else
          return null;
      },
      decoration: InputDecoration(
        hintText: 'admin@example.com',
        hintStyle: TextStyle(color: Color(0xff959595)),
        labelText: 'email',
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
    ) ,);
    final resetButton = Padding(
      padding: const EdgeInsets.symmetric(vertical:20.0),
      child: RaisedButton(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Center(
            child: Text(
              'Send Password Reset Link',
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
                    height: 100.0,
                  ),
                  logo,
                  _showCircularProgress(),
                  resetLink,
                  resetButton,
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
                        colors: [Colors.white70, const Color(0xFFA4DBE3), Colors.blueGrey], // whitish to gray
                      ),
                    ),
                    child: Image.asset('images/female_r.png'),
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
      _reset();
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
}//main class

