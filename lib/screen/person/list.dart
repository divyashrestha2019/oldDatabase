import 'dart:async';
import 'package:flutter/material.dart';
import 'package:database/database/person.dart';
import 'package:database/util/person_helper.dart';
import 'detail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonListState();
  }
}

enum Answers { YES, NO }

class PersonListState extends State<PersonList> {
  PersonHelper personHelper = PersonHelper();
  List<Person> orgList;
  int count = 0;
  String _value = '';

  void _setValue(String value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    if (orgList == null) {
      orgList = List<Person>();
      updateListView();
    }


    return Scaffold(
      body: getPersonListView(),
      floatingActionButton: SizedBox(
        height: 35.0,
        child: FloatingActionButton(
          onPressed: () {
            debugPrint('FAB clicked');
            navigateToDetail(
                Person('', 'SDF Group', '', '', 'Kharang', 'Nepal'),
                'Add Person');
          },
          tooltip: 'Add Person',
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
          backgroundColor: Color(0xff108F87),
        ),
      ),
    );
  }

  ListView getPersonListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.black,
            size: 40.0,
          ),
          title: Text(this.orgList[position].name),
          subtitle: Text(
            this.orgList[position].organization,
            style: TextStyle(color: Color(0xff3D3D3D)),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(FontAwesomeIcons.phone, color: Color(0xff101010)),
              GestureDetector(
                child: Icon(
                  Icons.delete,
                  color: Colors.teal,
                ),
                onTap: () {
                  _askUser();
                  // if( _showDelete(context, orgList[position] ) == true)
                  if (_value == 'Yes') {
                    _delete(context, orgList[position]);
                  }
                },
              ),
            ],
          ),
          onTap: () {
            debugPrint("ListTile Tapped");
            navigateToDetail(this.orgList[position], 'Edit person');
          },
        );
      },
    );
  }
  Future _askUser() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: new Text('Do you Want to delete ❓❓❓'),
            children: <Widget>[
              Row(
                children: <Widget>[
                  new SimpleDialogOption(
                    child: new Text('YES  🙂🙂🙂🙂 '),
                    onPressed: () {
                      Navigator.pop(context, Answers.YES);
                    },
                  ),
                  new SimpleDialogOption(
                    child: new Text('NO 🔥🔥🔥🔥'),
                    onPressed: () {
                      Navigator.pop(context, Answers.NO);
                    },
                  ),
                ],
              ),
            ],
          );
        })) {
      case Answers.YES:
        _setValue('Yes');
        break;
      case Answers.NO:
        _setValue('No');
        break;
    }
  }



  void _delete(BuildContext context, Person person) async {
    int result = await personHelper.deletePerson(person.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Person person, String name) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PersonDetail(person, name);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = personHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Person>> orgListFuture = personHelper.getOrgList();
      orgListFuture.then((orgList) {
        setState(() {
          this.orgList = orgList;
          this.count = orgList.length;
        });
      });
    });
  }
}
