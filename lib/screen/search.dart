import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  static const String id = 'search_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search contach'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                  showSearch(context: context, delegate: DataSearch());
                  }),
            ],
       ),
      drawer: Drawer(
        child: ProductAdmin(),
      ),
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
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = '';
      },),
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
        }
    );
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
    final  suggestionList = query.isEmpty
        ?recentCities
        :cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder( itemBuilder: (context,index) => ListTile(
      onTap: () {
        showResults(context);
      },
      leading: Icon(Icons.location_city),
      title: RichText(
        text : TextSpan(
            text: suggestionList[index].substring(0,query.length),
            style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(
                      color: Colors.grey)),
            ]),
      ),
    ),
      itemCount: suggestionList.length,
    );
  }
}

class ProductAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return DefaultTabController(
            length: 2,
            child: Scaffold(
              body: TabBarView(
                children: <Widget>[ProductCreate(), ProductList()],
              ),
              appBar: AppBar(
                title: Text('Home'),
                actions: <Widget>[
                  Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {},
                      ),
                      Container(
                        height: 35,
                        width: 60,
                        padding: EdgeInsets.only(right: 10),
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                        ),
                      )
                    ],
                  )
                ],
                bottom: TabBar(tabs: <Widget>[
                  Tab(
                    text: 'Create Product',
                  ),
                  Tab(
                    text: 'Product List',
                  ),
                ]),
              ),
            ));
  }
}

class ProductCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


