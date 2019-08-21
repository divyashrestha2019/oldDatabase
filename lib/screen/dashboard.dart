import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:database/layout/makeButton.dart';

class DashBoard extends StatefulWidget {
  static const String id = "dashboard_screen";
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool flagCheck = false;
  bool flagCheck2 = false;
  bool flagCheck3 = false;
  bool flagCheck4 = false;
  bool flagCheck5 = false;

  @override
  Widget build(BuildContext context) {
    final searchView = Container(
      height: 80.0,
      padding: EdgeInsets.only(top: 43.0, left: 8.0, right: 8.0),
      child: TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 00.0, 0.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            prefixIcon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Color(0xff108F87),
              ),
            )),
      ),
    );
    final yourSchedule = ListTile(
      title: Text(
        "Your Schedule",
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text('1 activity today'),
      trailing: SizedBox(
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
    );
    final computer = Container(
        height: 100.0,
        color: Color(0xffE2FFFD),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Hero(
              tag: 'hero',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    height: 100.0,
                    child: Image.asset('images/computer.png'),
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5.0,),
                  child: Text(
                    "Get the most out of ",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,right: 30.0),
                  child: Text(
                    "your free trial ",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                ),
                //  Text("your free trail"),
                SizedBox(
                  height: 33.0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0,right: 30.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.all(5.0),
                      color: Color(0xff108F87),
                      child: Text('CONTINUE SETUP',
                          style: TextStyle(color: Colors.white, fontSize: 8.0)),
                    ),
                  ),
                )
              ],
            )
            // Text("Get the most out of your free trial")
          ],
        ));
    final buttons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            height: 40.0,
            width: 150,
            child: new RaisedButton.icon(
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(right:10.0),
                child: Icon(FontAwesomeIcons.calendarAlt, color: Colors.white,size: 15.0,),
              ),
              label: Text(
                "11 Overdue",
                style: TextStyle(color: Colors.white,fontSize: 15.0),
              ),
              color: Colors.red,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            height: 40.0,
            width: 130.0,
            child: new RaisedButton.icon(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 4.0,
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(FontAwesomeIcons.envelope, color: Colors.white,size: 15.0,),
              ),
              label: Text(
                "1 Unread",
                style: TextStyle(color: Colors.white,fontSize: 15.0),
              ),
              color: Color(0xff108F87),
            ),
          ),
        ),
      ],
    );

    //buttons
    final plusButton = new RaisedButton.icon(
        onPressed: () {}, icon: Icon(Icons.add), label: Text(''),color: Colors.white,
        shape: RoundedRectangleBorder(side: BorderSide(width: 1.0,style: BorderStyle.solid,color: Colors.black26),
            borderRadius: BorderRadius.circular(10.0)),
        );
    final date = new Text("Tomorrow, June 4",
        style: TextStyle(color: Colors.black, fontSize: 16.0,fontWeight: FontWeight.bold));
    final plusButton2 = new RaisedButton.icon(
      onPressed: () {}, icon: Icon(Icons.add), label: Text(''),color: Colors.white,
      shape: RoundedRectangleBorder(side: BorderSide(width: 1.0,style: BorderStyle.solid,color: Colors.black26),
          borderRadius: BorderRadius.circular(10.0)),
    );
    final date2 = new Text("Wednesday, June 5",
        style: TextStyle(color: Colors.black, fontSize: 16.0,fontWeight: FontWeight.bold));
    final plusButton3 = new RaisedButton.icon(
      onPressed: () {}, icon: Icon(Icons.add), label: Text(''),color: Colors.white,
      shape: RoundedRectangleBorder(side: BorderSide(width: 1.0,style: BorderStyle.solid,color: Colors.black26),
          borderRadius: BorderRadius.circular(10.0)),
    );
    final date3 = new Text("Thrusday, June 6",
        style: TextStyle(color: Colors.black, fontSize: 16.0,fontWeight: FontWeight.bold));
    final plusButton4 = new RaisedButton.icon(
      onPressed: () {}, icon: Icon(Icons.add), label: Text(''),color: Colors.white,
      shape: RoundedRectangleBorder(side: BorderSide(width: 1.0,style: BorderStyle.solid,color: Colors.black26),
          borderRadius: BorderRadius.circular(10.0)),
    );
    final date4 = new Text("Friday, June 7",
        style: TextStyle(color: Colors.black, fontSize: 16.0,fontWeight: FontWeight.bold));
    final plusButton5 =new RaisedButton.icon(
      onPressed: () {}, icon: Icon(Icons.add), label: Text(''),color: Colors.white,
      shape: RoundedRectangleBorder(side: BorderSide(width: 1.0,style: BorderStyle.solid,color: Colors.black26),
          borderRadius: BorderRadius.circular(10.0)),
    );
    final date5 = new Text("Saturday, June 8",
        style: TextStyle(color: Colors.black, fontSize: 16.0,fontWeight: FontWeight.bold));
    final plusButton6 =new RaisedButton.icon(
      onPressed: () {}, icon: Icon(Icons.add), label: Text(''),color: Colors.white,
      shape: RoundedRectangleBorder(side: BorderSide(width: 1.0,style: BorderStyle.solid,color: Colors.black26),
          borderRadius: BorderRadius.circular(10.0)),
    );
    //main function
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 4.0, right: 4.0),
          children: <Widget>[
            searchView,
            yourSchedule,
            SizedBox(height: 0.0),
            computer,
            SizedBox(height: 10.0),
            buttons,
            SizedBox(height: 5.0),
            //activity start

            Padding(
              padding:
                  const EdgeInsets.only(left: 14.0, top: 20.0, bottom: 15.0),
              child: Text(
                'Today, June 3',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
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
              subtitle: Row(
                children: <Widget>[
                  Text(
                    '27 may 2017 1:45 PM. ',
                    style: TextStyle(color: Colors.red, fontSize: 12.0),
                  ),
                  Text(
                      'Saroj Thakuri',
                  style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
                  ),
                ],
              ),

              trailing: Checkbox(
                  value: flagCheck,
                  activeColor: Colors.teal,
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
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('27 may 2017 1:45PM. ',
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                      Text(
                        'Saroj Thakuri  ',
                        style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
                      ),
                    ],
                  ),
                  Text(
                    'Hello this is team message...',
                    style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
                  ),
                ],
              ),
              trailing: Checkbox(
                  activeColor: Colors.teal,
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
              subtitle: Row(
                children: <Widget>[
                  Text(
                    '27 may 2017 1:45 PM. ',
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                  Text(
                    'Saroj Thakuri',
                    style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
                  ),
                ],
              ),
              trailing: Checkbox(
                  activeColor: Colors.teal,
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
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('27 may 2017 1:45PM. ',
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                      Text(
                        'Saroj Thakuri  ',
                        style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
                      ),
                    ],
                  ),
                  Text(
                    'Hello this is team message...',
                    style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
                  ),
                ],
              ),
              trailing: Checkbox(
                  activeColor: Colors.teal,
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SvgPicture.asset('images/icons/vector.svg'),
              ),
              title: Text('Deadline'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('27 may 2017 1:45PM. ',
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                      Text(
                        'Saroj Thakuri  ',
                        style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
                      ),
                    ],
                  ),
                  Text(
                    'Hello this is team message...',
                    style: TextStyle(color: Color(0xff020202), fontSize: 12.0),
                  ),
                ],
              ),
              trailing: Checkbox(
                  activeColor: Colors.teal,
                  value: flagCheck5,
                  onChanged: (bool value) {
                    setState(() {
                      flagCheck5 = value;
                    });
                  }),
            ),
            SizedBox(
              height: 2,
              child: RaisedButton(
                onPressed: () {},
                color: Color(0xfff4f7f7),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            //activity ending
            plusButton,
            SizedBox(height: 5.0),
            date,
            SizedBox(height: 5.0),
            plusButton2,
            SizedBox(height: 5.0),
            date2,
            SizedBox(height: 5.0),
            plusButton3,
            SizedBox(height: 5.0),
            date3,
            SizedBox(height: 5.0),
            plusButton4,
            SizedBox(height: 5.0),
            date4,
            SizedBox(height: 5.0),
            plusButton5,
            SizedBox(height: 5.0),
            date5,
            SizedBox(height: 5.0),
            plusButton6
        ],
        ),
      ),
      bottomNavigationBar: MakeButton(),
    );
  }
}
