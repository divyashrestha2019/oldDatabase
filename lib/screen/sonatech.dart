import 'package:flutter/material.dart';
import 'package:database/layout/makeButton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:database/screen/profille.dart';
import 'package:database/screen/import_contact.dart';

class Sonatech extends StatelessWidget {
  static const String id = 'sonatech_screen';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   final emailButton =  Container(
      height: 45.0,
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[Icon(Icons.email)],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 5.0),
                child: Column(
                  children: <Widget>[Text('Email')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 150, 136, 1.0),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sonatech Nepal',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
            Text(
              'Deltatech Nepal',
              style: TextStyle(
                  color: Color.fromRGBO(232, 238, 247, 1), fontSize: 10.0),
            )
          ],
        ),
        leading: new Container(
          height: 10.0,
          padding: const EdgeInsets.only(left: 20.0),
          child: SvgPicture.asset('images/icons/user.svg'),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 26.0),
                  emailButton,
                  SizedBox(
                    height: 1.0,
                  ),
                  SizedBox(
                    height: 43.0,
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 12,
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SvgPicture.asset('images/icons/location.svg')
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: Column(
                                children: <Widget>[Text('NearBy')],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.0),
                  SizedBox(
                    height: 43.0,
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 12,
                      onPressed: () {
                        Navigator.pushNamed(context, Profile.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[Icon(Icons.settings)],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: Column(
                                children: <Widget>[Text('Admin')],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                        bottom: BorderSide(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: SizedBox(
                      height: 70.0,
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            leading: Image.asset(
                                'images/icons/sonatech_png.png',
                                height: 40.0),
                            title: Text(
                              'DeltasalesCRM Live Support',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Manage your sales activity on the go',
                              style: TextStyle(
                                  color: Color(0xffACACAC), fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 43.0,
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 12,
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[Icon(Icons.sync)],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: Column(
                                children: <Widget>[Text('Synchronize Data')],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.0),
                  SizedBox(
                    height: 43.0,
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 12,
                      onPressed: () {
                        Navigator.pushNamed(context, ImportContact.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[Icon(Icons.import_contacts)],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: Column(
                                children: <Widget>[Text('Import Contacts')],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.0),
                  SizedBox(
                    height: 43.0,
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 12,
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[Icon(Icons.help)],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: Column(
                                children: <Widget>[Text('About DeltaSalesCRM')],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.0),
                  SizedBox(
                    height: 43.0,
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 12,
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Icon(Icons.settings_applications)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: Column(
                                children: <Widget>[Text('Reset Password')],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.0),
                  SizedBox(
                    height: 43.0,
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 12,
                      onPressed: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Icon(Icons.power_settings_new)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: Column(
                                children: <Widget>[Text('Logout')],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: MakeButton(),
    );
  }
}
