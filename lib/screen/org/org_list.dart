import 'dart:async';
import 'package:flutter/material.dart';
import 'package:database/database/organization.dart';
import 'package:database/util/organization_helper.dart';
import 'package:database/screen/org/org_details.dart';
import 'package:sqflite/sqflite.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrgList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return OrgListState();
  }
}

class OrgListState extends State<OrgList> {

  OrganizationHelper organizationHelper = OrganizationHelper();
  List<Organization> orgList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if (orgList == null) {
      orgList = List<Organization>();
      updateListView();
    }

    return Scaffold(

      body: getOrgListView(),

      floatingActionButton: SizedBox(
        height: 35.0,
        child: FloatingActionButton(
          onPressed: () {
            debugPrint('FAB clicked');
            navigateToDetail(Organization('','','','Kharang', 'Nepal'), 'Add Organization');
          },

          tooltip: 'Add Organization',

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

  ListView getOrgListView() {


    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return ListTile(

          leading: Icon(FontAwesomeIcons.solidBuilding,
              color: Color(0xff101010),
          ),

          title: Text(this.orgList[position].name),

          subtitle: Text(this.orgList[position].country,style: TextStyle(
            color: Color(0xff3D3D3D),
          ),),

          trailing: GestureDetector(
            child: Icon(Icons.delete, color: Colors.teal,),
            onTap: () {
              _delete(context, orgList[position]);
            },
          ),


          onTap: () {
            debugPrint("ListTile Tapped");
            navigateToDetail(this.orgList[position],'Edit organization');
          },

        );
      },
    );
  }

  void _delete(BuildContext context, Organization organization) async {

    int result = await organizationHelper.deleteOrganization(organization.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Organization organization, String name) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return OrgDetails(organization, name);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {

    final Future<Database> dbFuture = organizationHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<Organization>> orgListFuture = organizationHelper.getOrgList();
      orgListFuture.then((orgList) {
        setState(() {
          this.orgList = orgList;
          this.count = orgList.length;
        });
      });
    });
  }
}







