import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddPerson extends StatefulWidget {
  static const String id = 'add_person_screen';

  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
   List<String> allCountries;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Color.fromRGBO(16, 143, 135, 1),
        leading: Icon(Icons.arrow_back),
        title: Text(
          'Add Person',
          style: TextStyle(fontSize: 18.0),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              right: 12.0,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'SAVE',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              FormBuilder(
                autovalidate: true,
                key: _fbKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 24.0),
                    DropdownButtonHideUnderline(
                      child: Container(
                        child: FormBuilderDropdown(
                          attribute: "name",
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 4.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                              BorderSide(color: Colors.white, width: 0.1),
                            ),
                            filled: true,
                            fillColor: Color(0xffD2E8E6),
                            icon: Icon(
                              FontAwesomeIcons.solidUser,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            labelText: 'Contact Name',
                            alignLabelWithHint: true,
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                          ),
                          initialValue: 'Santosh Adhikari',
                          items: [
                            'Willem Worthwood',
                            'Santosh Adhikari',
                            'Other'
                          ]
                              .map((person) => DropdownMenuItem(
                              value: person, child: Text("$person")))
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    DropdownButtonHideUnderline(
                      child: Container(
                        child: FormBuilderDropdown(
                          attribute: "organization",
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 4.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                              BorderSide(color: Colors.white, width: 0.1),
                            ),
                            filled: true,
                            fillColor: Color(0xffD2E8E6),
                            icon: Icon(
                              FontAwesomeIcons.solidBuilding,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            labelText: 'Organization Name',
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                          ),
                          initialValue: 'SDF Group',
                          items: ['SDF Group', 'Deltatech Nepal', 'Other']
                              .map((person) => DropdownMenuItem(
                              value: person, child: Text("$person")))
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                     DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 20.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                  color: Colors.white, width: 0.1),
                            ),
                            filled: true,
                            icon: Icon(
                              FontAwesomeIcons.solidEnvelope,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                            fillColor: Color(0xffD2E8E6),
                          ),
                          initialValue: 'Admin',
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.only(left:40.0),
                      child: SizedBox(
                        width: 280.0,
                        height: 50.0,
                        child:
                          RaisedButton(
                            child: Text('+',style: TextStyle(fontSize: 20.0),),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            onPressed:(){},
                            color: Colors.white,
                          ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 20.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                  color: Colors.white, width: 0.1),
                            ),
                            filled: true,
                            icon: Icon(
                              Icons.phone,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                            fillColor: Color(0xffD2E8E6),
                          ),
                          initialValue: '9829326110',
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                   /* FormBuilder(
                      child: CountryPicker(
                        dense: false,
                        showFlag: true,  //displays flag, true by default
                        showDialingCode: false, //displays dialing code, false by default
                        showName: true, //displays country name, true by default
                        onChanged: (Country country) {
                          setState(() {});
                        },
                      ),
                    ),*/
                   // const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.only(left:40.0),
                      child: SizedBox(
                        width: 280.0,
                        height: 50.0,
                        child:
                        RaisedButton(
                          child: Text('+',style: TextStyle(fontSize: 20.0),),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          onPressed:(){},
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0,),
                    DropdownButtonHideUnderline(
                      child: FormBuilderTextField(
                        attribute: "country",
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                                color: Colors.white, width: 0.1),
                          ),
                          filled: true,
                          icon: Icon(
                            FontAwesomeIcons.globeAsia,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          labelText: 'Enter Country',
                        ),),
                    ),
                    const SizedBox(height: 24.0),
                    DropdownButtonHideUnderline(
                      child: Container(
                        child: FormBuilderDropdown(
                          attribute: "city",
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 4.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                              BorderSide(color: Colors.white, width: 0.1),
                            ),
                            filled: true,
                            fillColor: Color(0xffD2E8E6),
                            icon: Icon(
                              FontAwesomeIcons.mapMarked,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            labelText: 'City',
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                          ),
                          initialValue: 'Biratnagar',
                          items: ['Biratnagar', 'Dharan', 'Other']
                              .map((person) => DropdownMenuItem(
                              value: person, child: Text("$person")))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



