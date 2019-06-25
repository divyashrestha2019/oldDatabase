import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends StatelessWidget {
  static const String id = 'search_screen';
  @override
  Widget build(BuildContext context) {
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
              getPeople(),
              getOrganization(),
            ]),
          )),
    );
  }
}

Widget getPeople() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(
          Icons.person,
          color: Colors.black,
          size: 40.0,
        ),
        title: Text('Vagwan Mandal'),
        subtitle: Text(
          'Deltatech Nepal',
          style: TextStyle(color: Color(0xff3D3D3D)),
        ),
        trailing: Icon(FontAwesomeIcons.phone, color: Color(0xff101010)),
      ),
      ListTile(
        leading: Icon(
          Icons.person,
          color: Colors.black,
          size: 40.0,
        ),
        title: Text('Vagwan Mandal'),
        subtitle: Text(
          'Deltatech Nepal',
          style: TextStyle(color: Color(0xff3D3D3D)),
        ),
        trailing: Icon(FontAwesomeIcons.phone, color: Color(0xff101010)),
      ),
      ListTile(
        leading: Icon(
          Icons.person,
          color: Colors.black,
          size: 40.0,
        ),
        title: Text('Vagwan Mandal'),
        subtitle: Text(
          'Deltatech Nepal',
          style: TextStyle(color: Color(0xff3D3D3D)),
        ),
        trailing: Icon(FontAwesomeIcons.phone, color: Color(0xff101010)),
      ),
      ListTile(
        leading: Icon(
          Icons.person,
          color: Colors.black,
          size: 40.0,
        ),
        title: Text('Vagwan Mandal'),
        subtitle: Text(
          'Deltatech Nepal',
          style: TextStyle(color: Color(0xff3D3D3D)),
        ),
        trailing: Icon(FontAwesomeIcons.phone, color: Color(0xff101010)),
      ),
      ListTile(
        leading: Icon(
          Icons.person,
          color: Colors.black,
          size: 40.0,
        ),
        title: Text('Vagwan Mandal'),
        subtitle: Text(
          'Deltatech Nepal',
          style: TextStyle(color: Color(0xff3D3D3D)),
        ),
        trailing: Icon(FontAwesomeIcons.phone, color: Color(0xff101010)),
      ),
    ],
  );
  return listView;
}

Widget getOrganization() {
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
    ],
  );
  return listView;
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
