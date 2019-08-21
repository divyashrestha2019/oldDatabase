import 'package:flutter/material.dart';
class ImportContact extends StatefulWidget {
  static const String id = 'contact_screen';

  @override
  _ImportContactState createState() => _ImportContactState();
}

class _ImportContactState extends State<ImportContact> {

  bool flagCheck = false;
  bool flagCheck1 = false;
  bool flagCheck2 = false;
  bool flagCheck3 = false;
  bool flagCheck4 = false;
  bool flagCheck5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff108F87), 
        title: Text('Contact Import'),
        leading: Icon(Icons.arrow_back),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  hintText: 'Search',
                  fillColor: Colors.white,
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:1.0,color: Color(0xff108F87)),
                    borderRadius: BorderRadius.circular(15.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.7),
                    borderSide: BorderSide(color: Color(0xff555555),width: 1.5),
                  )
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
          ListTile(
            leading: Image.asset('images/icons/contact.png'),
            title: Text('Bikash Kr Jha'),
            trailing: Checkbox(
                value: flagCheck,
                onChanged: (bool value) {
                  setState(() {
                    flagCheck = value;
                  });
                }),
          ),
          SizedBox(
            height: 0.1,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.white70,
            ),
          ),
          ListTile(
            leading: Image.asset('images/icons/ellipse.png'),
            title: Text('Santosh Adhikari'),
            trailing: Checkbox(
                value: flagCheck1,
                onChanged: (bool value) {
                  setState(() {
                    flagCheck2 = value;
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
          ListTile(
            leading: Image.asset('images/icons/contact.png'),
            title: Text('Jagat chaudhary'),
            trailing: Checkbox(
                value: flagCheck2,
                onChanged: (bool value) {
                  setState(() {
                    flagCheck2 = value;
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
          ListTile(
            leading: Image.asset('images/icons/ellipse.png'),
            title: Text('Paban Acharya'),
            trailing: Checkbox(
                value: flagCheck3,
                onChanged: (bool value) {
                  setState(() {
                    flagCheck3 = value;
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
          ListTile(
            leading: Image.asset('images/icons/contact.png'),
            title: Text('Rupesh Ghimire'),
            trailing: Checkbox(
                value: flagCheck4,
                onChanged: (bool value) {
                  setState(() {
                    flagCheck3 = value;
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
          ListTile(
            leading: Image.asset('images/icons/ellipse.png'),
            title: Text('Anil G'),
            trailing: Checkbox(
                value: flagCheck5,
                onChanged: (bool value) {
                  setState(() {
                    flagCheck3 = value;
                  });
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(onPressed: (){
                  setState(() {

                     flagCheck = true;
                     flagCheck1 = true;
                     flagCheck2 = true;
                     flagCheck3 = true;
                     flagCheck4 = true;
                     flagCheck5 = true;

                  });
                },
                    child: Text('SELECT ALL',style: TextStyle(color: Color(0xff108F87),fontSize: 15.0),)),
                FlatButton(
                  onPressed: (){
                    setState(() {

                       flagCheck = false;
                       flagCheck1 = false;
                       flagCheck2 = false;
                       flagCheck3 = false;
                       flagCheck4 = false;
                       flagCheck5 = false;

                    });
                  },
                    child: Text('CLEAR',style: TextStyle(color: Color(0xff108F87),fontSize: 15.0),)),
              ],
            ),
          ),
        ),

      ),
    );
  }
}