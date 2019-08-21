import 'package:flutter/material.dart';
import 'new_verify.dart';

class Proceed extends StatelessWidget {
  static const String id = "proceed_sceen";
  static String code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 150.0,
          ),
          Container(
            child: Image.asset('images/delta.png'),
            height: 100.0,
          ),
          Container(
            height: 100.0,
            child: Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top:20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                onChanged: (value) {
                  //Do something with the user input.
                  code = value;
                },
                decoration:InputDecoration(
                  hintText: 'Democompany',
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
              ),
            ),
          ),
          Container(
            height: 55.0,
            child: Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Center(child: Text('Proceed',style: TextStyle(color: Colors.white),)),
                onPressed: (){
                  Navigator.pushNamed(context, Verification.id);
                },
                color: Color(0xff108F87),

              ),
            ),
          ),
          Container(
            height: 280.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
                colors: [Colors.white70, const Color(0xFFA4DBE3), Colors.blueGrey], // whitish to gray
              ),
            ),
          )
        ],
      ) ,
    );
  }
}
