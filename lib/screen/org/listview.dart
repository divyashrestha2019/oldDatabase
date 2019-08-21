import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget getOrganization(BuildContext context) {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(
          FontAwesomeIcons.solidBuilding,
          color: Color(0xff101010),
        ),
        title: Text('Deltatech Nepal'),
        subtitle: Text(
          'Nepal',
          style: TextStyle(
            color: Color(0xff3D3D3D),
          ),
        ),
      ),
      ListTile(
        leading: Icon(
          FontAwesomeIcons.solidBuilding,
          color: Color(0xff101010),
        ),
        title: Text('Golchha org'),
        subtitle: Text(
          'Nepal',
          style: TextStyle(
            color: Color(0xff3D3D3D),
          ),
        ),
      ),
      ListTile(
        leading: Icon(
          FontAwesomeIcons.solidBuilding,
          color: Color(0xff101010),
        ),
        title: Text('Hulash Wire'),
        subtitle: Text(
          'Nepal',
          style: TextStyle(
            color: Color(0xff3D3D3D),
          ),
        ),
      ),
      ListTile(
        leading: Icon(
          FontAwesomeIcons.solidBuilding,
          color: Color(0xff101010),
        ),
        title: Text('Royel xx'),
        subtitle: Text(
          'Nepal',
          style: TextStyle(
            color: Color(0xff3D3D3D),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left:280.0,top: 60),
        child: SizedBox(
          height: 35,
          child: FloatingActionButton(
            onPressed: () {
             // Navigator.pushNamed(context, AddOrganization.id);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,
            ),
            backgroundColor: Color(0xff108F87),
          ),
        ),
      ),
    ],
  );
  return listView;
}





