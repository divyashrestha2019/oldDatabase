import 'package:flutter/material.dart';
import 'package:database/screen/login.dart';
import 'package:database/screen/forgot.dart';
import 'package:database/screen/add_deal.dart';
import 'package:database/screen/add_person.dart';
import 'package:database/screen/profille.dart';
import 'package:database/screen/search.dart';
import 'package:database/dynamic_form/dynamic_fields.dart';
import 'package:database/screen/sonatech.dart';
import 'package:database/screen/activity.dart';

void main() => runApp(DeltaCrm());

class DeltaCrm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'sans serif'),
      /*theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),*/
      // ),
      home: Activity(),
      initialRoute: Activity.id,
      routes: {
        LoginScreen.id:(context) => LoginScreen(),
        ForgotScreen.id:(context) => ForgotScreen(),
        AddDeal.id:(context) => AddDeal(),
        AddPerson.id:(context) => AddPerson(),
        Profile.id:(context) => Profile(),
        Search.id:(context) =>Search(),
        DynamicFieldsPage.id:(context)=>DynamicFieldsPage(),
        Sonatech.id:(context) => Sonatech(),
      },
    );
  }
}
