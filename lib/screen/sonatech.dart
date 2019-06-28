import 'package:flutter/material.dart';
import 'package:database/layout/makeButton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:database/screen/profille.dart';


class Sonatech extends StatelessWidget {
  static const String id = 'sonatech_screen';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListPage(title: 'Lessons');
    // home: DetailPage(),
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
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
            style: TextStyle(color: Color.fromRGBO(232, 238, 247,1), fontSize: 10.0),
          )
        ],
      ),
      leading: new Container(
        height: 10.0,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SvgPicture.asset('images/icons/user.svg'),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar,
      body: Scroller(),
      bottomNavigationBar: MakeButton(),
    );
  }
}

class Scroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 24.0),
                SizedBox(
                    height:2.0),
                SizedBox(
                  height: 40.0,
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
                          Column(
                            children: <Widget>[Text('Email')],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                SizedBox(
                  height: 40.0,
                  child: RaisedButton(
                    color: Colors.white,
                    elevation: 12,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[SvgPicture.asset('images/icons/location.svg')],
                          ),
                          Column(
                            children: <Widget>[Text('NearBy')],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.0),
                SizedBox(
                  height: 40.0,
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
                          Column(
                            children: <Widget>[Text('Admin')],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                SizedBox(
                  height: 80.0,
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                        Image.asset('images/sonatech.png'),
                      ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                SizedBox(
                  height: 40.0,
                  child: RaisedButton(
                    color: Colors.white,
                    elevation: 12,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[Icon(Icons.add_location)],
                          ),
                          Column(
                            children: <Widget>[Text('NearBy')],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.0),
                SizedBox(
                  height: 40.0,
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
                          Column(
                            children: <Widget>[Text('Synchronize Data')],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.0),
                SizedBox(
                  height: 40.0,
                  child: RaisedButton(
                    color: Colors.white,
                    elevation: 12,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[Icon(Icons.import_contacts)],
                          ),
                          Column(
                            children: <Widget>[Text('Import Contacts')],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.0),
                SizedBox(
                  height: 40.0,
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
                          Column(
                            children: <Widget>[Text('About DeltaSalesCRM')],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.0),
                SizedBox(
                  height: 40.0,
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
                          Column(
                            children: <Widget>[Text('Reset Password')],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.0),
                SizedBox(
                  height: 40.0,
                  child: RaisedButton(
                    color: Colors.white,
                    elevation: 12,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[Icon(Icons.power_settings_new)],
                          ),
                          Column(
                            children: <Widget>[Text('Logout')],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 80,),
              ],
            ),
          ),
        );
      },
    );
  }
}
