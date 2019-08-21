import 'package:database/database/organization.dart';
import 'package:database/util/organization_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'email.dart';
import 'phone.dart';

class OrgDetails extends StatefulWidget {
  final String appBarTitle;
  final Organization organization;

  OrgDetails(this.organization, this.appBarTitle);
  @override
  State<StatefulWidget> createState() {
    return OrgDetailsState(this.organization, this.appBarTitle);
  }
}

class OrgDetailsState extends State<OrgDetails>
    with SingleTickerProviderStateMixin {
  static var _countries = ['Nepal', 'India', 'China'];
  static var _cities = ['Biratnagar', 'Itahari', 'Kharang'];

  List<Widget> _emailWidgets = List<Widget>();
  List<Widget> _phoneWidgets = List<Widget>();

  OrganizationHelper organizationHelper = OrganizationHelper();
  Organization organization;
  String appBarTitle;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String _phone;

  OrgDetailsState(this.organization, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    //TextStyle textStyle = Theme.of(context).textTheme.title;
    double _width = MediaQuery.of(context).size.width*0.82;

    nameController.text = organization.name;
    emailController.text = organization.email;
    phoneController.text = organization.phone;

    final addEmail = Padding(
      padding: const EdgeInsets.only(left: 34.0,right: 8.0),
      child: SizedBox(
        width: 285.0,
        height: 50.0,
        child: RaisedButton(
          child: Text(
            '+',
            style: TextStyle(fontSize: 20.0),
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.black26, width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10.0)),
          onPressed: () {
            setState(() {
              _emailWidgets.add(Email(
                fieldName: 'Email Address',
              ));
            });
          },
          color: Colors.white,
        ),
      ),
    );
    final addPhone = Padding(
      padding: const EdgeInsets.only(left: 34.0,right: 8.0),
      child: SizedBox(
        width: 280.0,
        height: 50.0,
        child: RaisedButton(
          child: Text(
            '+',
            style: TextStyle(fontSize: 20.0),
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.black26, width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10.0)),
          onPressed: () {
            setState(() {
              _phoneWidgets.add(Phone(
                fieldName: 'Phone Number',
              ));
            });
          },
          color: Colors.white,
        ),
      ),
    );

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff108F87),
          title: Text(appBarTitle, style: TextStyle(fontSize: 18.0),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Write some code to control things, when user press back button in AppBar
                moveToLastScreen();
              }),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                right: 12.0,
              ),
              child: GestureDetector(
                onTap: () { _save();
                  },
                child: Text(
                  'SAVE',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 24.0),
              //organization name
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    debugPrint('Something changed in Name Text Field');
                    updateName();
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(color: Colors.white, width: 0.1),
                    ),
                    filled: true,
                    icon: Icon(
                      FontAwesomeIcons.solidBuilding,
                      color: Colors.black,
                      size: 20.0,
                    ),
                    labelText: 'Organization Name',
                    labelStyle: TextStyle(
                        fontSize: 15.0,
                        height: 1.5,
                        color: Color.fromRGBO(61, 61, 61, 1)),
                    fillColor: Color(0xffD2E8E6),
                    hintText: "SGF Group",
                    hintMaxLines: 2,
                    alignLabelWithHint: false,
                  ),
                  maxLines: 1,
                ),
              ),

              //Email
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    debugPrint('Something changed in Email Text Field');
                    updateEmail();
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(color: Colors.white, width: 0.1),
                    ),
                    filled: true,
                    icon: Icon(
                      FontAwesomeIcons.solidEnvelope,
                      color: Colors.black,
                      size: 20.0,
                    ),
                    labelText: 'Email Address',
                    labelStyle: TextStyle(
                        fontSize: 15.0,
                        height: 1.5,
                        color: Color.fromRGBO(61, 61, 61, 1)),
                    hintText: 'Admin',
                    fillColor: Color(0xffD2E8E6),
                  ),
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 24.0),

              //email padding
              addEmail,
              Column(
                children: List.generate(_emailWidgets.length, (i) {
                  return _emailWidgets[i];
                }),
              ),
              const SizedBox(height: 24.0),

              // Third Element
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  onChanged: (value) {
                    //debugPrint('Something changed in Phone Number Text Field');
                    _phone = value;
                    updatePhone();
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(color: Colors.white, width: 0.1),
                    ),
                    filled: true,
                    icon: Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 20.0,
                    ),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        fontSize: 15.0,
                        height: 1.5,
                        color: Color.fromRGBO(61, 61, 61, 1)),
                    fillColor: Color(0xffD2E8E6),
                  ),
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 24.0),
              addPhone,
              Column(
                children: List.generate(_phoneWidgets.length, (i) {
                  return _phoneWidgets[i];
                }),
              ),
              const SizedBox(height: 24.0),
              // Fourth Element
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(FontAwesomeIcons.mapMarked,
                    color: Colors.black,
                    size: 20.0,),
                  SizedBox(width: 8.0,),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Container(
                      height: 55.0,
                      width: _width,
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Color(0xffD2E8E6),
                        borderRadius: BorderRadius.all(Radius.circular(10.0),
                        ),

                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            items: _cities.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            style: TextStyle(color: Color.fromRGBO(61, 61, 61, 1),fontSize: 15.0),
                            value: organization.city,
                            onChanged: (valueSelectedByUser) {
                              setState(() {
                                debugPrint('User selected $valueSelectedByUser');
                                updateCity(valueSelectedByUser);
                              });
                            }),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24.0),
              //fifth
              Row(
                children: <Widget>[
                  //contentPadding: EdgeInsets.symmetric(horizontal: 100.0),
                  Icon(
                    FontAwesomeIcons.globeAsia,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  SizedBox(width: 8.0,),
                  //contentPadding: EdgeInsets.only(right: 0),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Container(
                      height: 55.0,
                      width: _width,
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Color(0xffD2E8E6),
                        borderRadius: BorderRadius.all(Radius.circular(10.0),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            items: _countries.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            style: TextStyle(color: Color.fromRGBO(61, 61, 61, 1),fontSize: 15.0),
                            value: organization.country,
                            onChanged: (valueSelectedByUser) {
                              setState(() {
                                debugPrint('User selected $valueSelectedByUser');
                                updateCountry(valueSelectedByUser);
                              });
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              //sixth
              SizedBox(height: 24.0,),
              //sixth
            ],
          ),
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updateCity(String newCity) {
    organization.city = newCity;
  }

  void updateCountry(String newCountry) {
    organization.country = newCountry;
  }

  void updateName() {
    organization.name = nameController.text;
  }

  void updateEmail() {
    organization.email = emailController.text;
  }

  void updatePhone() {
    organization.phone = _phone;
  }

  void _save() async {
    moveToLastScreen();
    int result;
    if (organization.id != null) {
      //update
      result = await organizationHelper.updateOrganization(organization);
    } else {
      //insert
      result = await organizationHelper.insertOrganization(organization);
    }

    if (result != 0) {
      _showAlertDialog('Status', 'Organization added successfully');
    } else {
      _showAlertDialog('Status', 'Problem on saveing Organization');
    }
  }

  _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}


