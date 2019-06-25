import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:database/layout/makeButton.dart';

class Activity extends StatefulWidget {
  static const String id = 'activity_screen';
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff108F87),
        title: Text('Activity'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.solidCalendarAlt,
                color: Colors.white,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.filter,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: GetPeople(),
    );
  }
}

class GetPeople extends StatefulWidget {
  @override
  _GetPeopleState createState() => _GetPeopleState();
}

class _GetPeopleState extends State<GetPeople> {
  bool flagCheck = false;
  bool flagCheck2 = false;
  bool flagCheck3 = false;
  bool flagCheck4 = false;
  bool flagCheck5 = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 20.0, bottom: 15.0),
          child: Text(
            'PLANNED 5',
            style: TextStyle(color: Color(0xff108F87), fontSize: 15.0),
          ),
        ),
        SizedBox(
          height: 2,
          child: RaisedButton(
            onPressed: () {},
            color: Color(0xfff4f7f7),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.call,
            color: Colors.black,
            size: 25.0,
          ),
          title: Text('Call'),
          subtitle: Text(
            '27 may 2017 1:45 PM. Saroj Thakuri',
            style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
          ),
          trailing: Checkbox(
              value: flagCheck,
              onChanged: (bool value) {
                setState(() {
                  flagCheck = value;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: SizedBox(
            height: 0.1,
            child: RaisedButton(
              onPressed: () {},
              color: Color(0xffCCCCCC),
            ),
          ),
        ),
        ListTile(
          isThreeLine: true,
          leading: Icon(
            Icons.email,
            color: Colors.black,
            size: 25.0,
          ),
          title: Text('Delta@gmail.com'),
          subtitle: Text(
            '27 may 2017 1:45 PM. Saroj Thakuri  Hello this is team message...',
            style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
          ),
          trailing: Checkbox(
              value: flagCheck2,
              onChanged: (bool value) {
                setState(() {
                  flagCheck2 = value;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: SizedBox(
            height: 0.1,
            child: RaisedButton(
              onPressed: () {},
              color: Color(0xffCCCCCC),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.group,
            color: Colors.black,
            size: 25.0,
          ),
          title: Text('Meeting'),
          subtitle: Text(
            '27 may 2017 1:45 PM. Saroj Thakuri',
            style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
          ),
          trailing: Checkbox(
              value: flagCheck3,
              onChanged: (bool value) {
                setState(() {
                  flagCheck3 = value;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: SizedBox(
            height: 0.1,
            child: RaisedButton(
              onPressed: () {},
              color: Color(0xffCCCCCC),
            ),
          ),
        ),
        ListTile(
          isThreeLine: true,
          leading: Icon(
            FontAwesomeIcons.clock,
            color: Colors.black,
            size: 25.0,
          ),
          title: Text('delta@gmail.com'),
          subtitle: Text(
            '27 may 2017 1:45 PM. Saroj Thakuri  Hello this is team messages...',
            style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
          ),
          trailing: Checkbox(
              value: flagCheck4,
              onChanged: (bool value) {
                setState(() {
                  flagCheck4 = value;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 70.0,
          ),
          child: SizedBox(
            height: 0.1,
            child: RaisedButton(
              onPressed: () {},
              color: Color(0xffCCCCCC),
            ),
          ),
        ),
        ListTile(
          isThreeLine: true,
          leading: Container(
            height: 25.0,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SvgPicture.asset('images/icons/vector.svg'),
          ),
          title: Text('Deadline'),
          subtitle: Text(
            '27 may 2017 1:45 PM. Saroj Thakuri  Hello this is team messages...',
            style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
          ),
          trailing: Checkbox(
              value: flagCheck5,
              onChanged: (bool value) {
                setState(() {
                  flagCheck5 = value;
                });
              }),
        ),
        SizedBox(
          height: 0.1,
          child: RaisedButton(
            onPressed: () {},
            color: Color(0xffCCCCCC),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:280.0,top: 60),
          child: SizedBox(
            height: 35,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30.0,
              ),
              backgroundColor: Color(0xff108F87),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:25.0),
          child: MakeButton(),
        ),
      ],
    );
  }
}
