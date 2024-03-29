import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class JsonApiDropdown extends StatefulWidget {
static final String id = 'city_screen';
  @override
  JsonApiDropdownState createState() {
    return new JsonApiDropdownState();
  }
}

class JsonApiDropdownState extends State<JsonApiDropdown> {
  Users _currentUser;

  final String uri = 'http://leadmgmtv2.deltatech.com.np/api/countries-states-cities      ';

  Future<List<Users>> _fetchUsers() async {
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Users> listOfUsers = items.map<Users>((json) {
        return Users.fromJson(json);
      }).toList();

      return listOfUsers;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetching data from JSON - DropdownButton'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FutureBuilder<List<Users>>(
                future: _fetchUsers(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Users>> snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  return DropdownButton<Users>(
                    items: snapshot.data
                        .map((user) => DropdownMenuItem<Users>(
                      child: Text(user.name),
                      value: user,
                    ))
                        .toList(),
                    onChanged: (Users value) {
                      setState(() {
                        _currentUser = value;
                      });
                    },
                    isExpanded: false,
                    //value: _currentUser,
                    hint: Text('Select User'),
                  );
                }),
            SizedBox(height: 20.0),
            _currentUser != null
                ? Text("Name: " +
                _currentUser.name +
                "\n Email: " +
                _currentUser.email +
                "\n Username: " +
                _currentUser.username)
                : Text("No User selected"),
          ],
        ),
      ),
    );
  }
}


class Users {
  int id;
  String name;
  String username;
  String email;

  Users({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
    );
  }
}