import 'package:flutter/material.dart';
import 'package:database/screen/login.dart';
import 'package:database/screen/add_deal.dart';
import 'package:database/screen/add_person.dart';
import 'package:database/screen/profille.dart';
import 'package:database/screen/search.dart';
import 'package:database/screen/sonatech.dart';
import 'package:database/screen/activity.dart';
import 'package:database/screen/add_organization.dart';
import 'package:database/screen/add_activity.dart';
import 'package:database/screen/import_contact.dart';
import 'package:database/screen/Reset.dart';
import 'package:database/screen/proceed.dart';
import 'package:database/screen/reset_password.dart';
import 'package:database/screen/new_verify.dart';
import 'package:database/screen/dashboard.dart';

void main() => runApp(DeltaCrm());

class DeltaCrm extends StatelessWidget {
static const String url = "http://leadmgmtv2.deltatech.com.np/api";
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
      home: Search(),
      initialRoute: Search.id,
      routes: {
        LoginPage.id:(context) => LoginPage(),
        Verification.id:(context) => Verification(),
        AddDeal.id:(context) => AddDeal(),
        AddPerson.id:(context) => AddPerson(),
        Profile.id:(context) => Profile(),
        Search.id:(context) =>Search(),
        Sonatech.id:(context) => Sonatech(),
        Activity.id:(context) => Activity(),
        AddOrganization.id:(context)=>AddOrganization(),
        AddActivity.id:(context)=>AddActivity(),
        ImportContact.id:(context)=>ImportContact(),
        Proceed.id:(context)=>Proceed(),
        Reset.id:(context)=>Reset(),
        PasswordReset.id:(context)=>PasswordReset(),
        DashBoard.id:(context)=>DashBoard(),
      },
    );
  }
}
