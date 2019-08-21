import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:database/layout/makeButton.dart';
import 'package:database/screen/add_organization.dart';
import 'package:database/screen/add_person.dart';
import 'package:database/screen/org/org_list.dart';
import 'package:database/screen/person/list.dart';

class Search extends StatelessWidget {
  static const String id = 'search_screen';
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff108F87),
              title: Padding(
                padding: const EdgeInsets.only(top: 11.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        showSearch(context: context, delegate: DataSearch());
                      },
                    ),
                      suffixIcon: IconButton(
                          icon: Icon(FontAwesomeIcons.filter),
                          onPressed: () {
                            debugPrint('okay');
                          }),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff108F87)),
                      borderRadius: BorderRadius.circular(15.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff108F87)),
                      borderRadius: BorderRadius.circular(15.7),
                    ),
                  ),
                  textInputAction: TextInputAction.search,
                ),
              ),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "People",
                  ),
                  Tab(
                    text: "organization",
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              PersonList(),
              OrgList(),
            ]),
            bottomNavigationBar: MakeButton(),
          )),
    );
  }
}


class DataSearch extends SearchDelegate<String> {
  final cities = [
    'Kathmandu',
    'Pokhara',
    'Lalitpur',
    'Bharatpur',
    'Biratnagar',
    'Birgunj',
    'Janakpur',
    'Ghorahi',
    'Hetauda',
    'Dhangadhi',
    'Tulsipur',
    'Itahari',
    'Nepalgunj',
    'Butwal',
    'Dharan'
  ];
  final recentCities = [
    'Kathmandu',
    'Pokhara',
    'Lalitpur',
    'Bharatpur',
    'Biratnagar'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(Icons.person),
            title: RichText(
              text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey)),
                  ]),
            ),
            subtitle: Text('Deltatech Nepal'),
            trailing: Icon(Icons.call),
          ),
      itemCount: suggestionList.length,
    );
  }
}
