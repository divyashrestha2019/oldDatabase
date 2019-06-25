import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddPerson extends StatefulWidget {
  static const String id = 'add_person_screen';

  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
   List<String> allCountries;

  Widget addContact() {
    return  FormBuilderTextField(
      attribute: "phone",
      keyboardType: TextInputType.phone,
      decoration:  InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        filled: true,
        icon: Icon(Icons.phone),
        labelText: 'Email address',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.teal.shade500,
        leading: Icon(
            Icons.arrow_back),
        title: Text('Add Person',
          style: TextStyle(
          ),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text('SAVE',style: TextStyle(inherit: true,fontSize: 20.0,),),
              IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () {},
              ),
            ],
          ),],
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
                    FormBuilderDropdown(
                      attribute: "name",
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        filled: true,
                        icon: Icon(Icons.person),
                        labelText: 'Name',
                      ),
                      hint: Text('Emma Watson') ,
                      items: ['Emma Watson', 'The Messsi Folower', 'Santosh Adhikari','Other']
                          .map((person) => DropdownMenuItem(
                          value: person,
                          child: Text("$person")
                      )).toList(),
                    ),
                    const SizedBox(height: 24.0),
                    FormBuilderDropdown(
                      attribute: "oraganization",
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        filled: true,
                        icon: Icon(Icons.business),
                        labelText: 'Organization Name',
                      ),
                      hint: Text('SDF Group'),
                      items: ['SDF Group', 'Arihant','Other']
                          .map((organization) => DropdownMenuItem(
                          value: organization,
                          child: Text("$organization")
                      )).toList(),
                    ),
                    const SizedBox(height: 24.0),
                    FormBuilderTextField(
                      attribute: "email",
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        filled: true,
                        icon: Icon(Icons.email),
                        labelText: 'Email address',
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: 300.0,
                      child:
                        RaisedButton(
                          child: Text('+'),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                          onPressed:(){
                            addContact();
                          },
                        ),
                    ),
                    const SizedBox(height: 24.0),
                    FormBuilderTextField(
                      attribute: "phone",
                      keyboardType: TextInputType.phone,
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        filled: true,
                        icon: Icon(Icons.phone),
                        labelText: 'Phone Number',
                      ),),
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
                    SizedBox(
                      width: 300.0,
                      child:
                      RaisedButton(
                        child: Text('+'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                        onPressed:(){
                          addContact();
                        },
                      ),
                    ),
                    const SizedBox(height: 24.0,),
                    FormBuilderTextField(
                      attribute: "country",
                      keyboardType: TextInputType.text,
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        filled: true,
                        icon: Icon(Icons.map),
                        labelText: 'Enter Country',
                      ),),
                    const SizedBox(height: 24.0),
                    FormBuilderTextField(
                      attribute: "city",
                      keyboardType: TextInputType.text,
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        filled: true,
                        icon: Icon(Icons.location_city),
                        labelText: 'Enter City',
                      ),),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          child: Text("Submit"),
                          color: Colors.blueAccent,
                          onPressed: () {
                            _fbKey.currentState.save();
                            if (_fbKey.currentState.validate()) {
                              print(_fbKey.currentState.value);
                            }
                          },
                        ),
                        RaisedButton(
                          child: Text("Reset"),
                          color: Colors.redAccent,
                          onPressed: () {
                            _fbKey.currentState.reset();
                          },
                        ),
                        SizedBox(height: 30.0,)
                      ],
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



