import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddDeal extends StatefulWidget {
  static const String id = 'add_deal_screen';
  @override
  _AddDealState createState() => _AddDealState();
}

class _AddDealState extends State<AddDeal> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  static final formColor = Color(0xffD2E8E6);
  static final backColor = Color.fromRGBO(16, 143, 135, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backColor,
        leading: Icon(Icons.arrow_back),
        title: Text(
          'Add Deal',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              FormBuilder(
                autovalidate: true,
                key: _fbKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                              size: 30.0,
                            ),
                            labelText: 'Contact Name',
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
                              size: 30.0,
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
                      child: Container(
                        child: FormBuilderDropdown(
                          attribute: "owner",
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
                              size: 30.0,
                            ),
                            labelText: 'Owner',
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                          ),
                          initialValue: 'Admin',
                          items: ['Admin', 'Manager', 'Other']
                              .map((person) => DropdownMenuItem(
                                  value: person, child: Text("$person")))
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Container(
                          child: Flexible(
                            flex: 1,
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
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
                                      FontAwesomeIcons.dollarSign,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                    labelText: 'Worth',
                                    labelStyle: TextStyle(
                                        fontSize: 18.0,
                                        color: Color.fromRGBO(61, 61, 61, 1)),
                                    fillColor: Color(0xffD2E8E6),
                                  ),
                                  initialValue: '7980008',
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Flexible(
                            flex: 1,
                            child: DropdownButtonHideUnderline(
                              child: Container(
                                child: FormBuilderDropdown(
                                  attribute: "currency",
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 4.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0.1),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffD2E8E6),
                                    labelText: 'Currency',
                                    labelStyle: TextStyle(
                                        fontSize: 18.0,
                                        color: Color.fromRGBO(61, 61, 61, 1)),
                                  ),
                                  initialValue: 'NPR',
                                  items: ['NPR', 'US', 'Other']
                                      .map((person) => DropdownMenuItem(
                                          value: person,
                                          child: Text("$person")))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    DropdownButtonHideUnderline(
                      child: Container(
                        child: FormBuilderDropdown(
                          attribute: "pipeline",
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
                              FontAwesomeIcons.alignLeft,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            labelText: 'Select Pipelline',
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                          ),
                          initialValue: 'Default',
                          items: ['Default', 'Hot Deal', 'Other']
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
                          attribute: "stage",
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
                              FontAwesomeIcons.chartLine,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            labelText: 'Stage',
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                          ),
                          initialValue: 'Lead In',
                          items: ['Lead In', 'Lost', 'Other']
                              .map((person) => DropdownMenuItem(
                                  value: person, child: Text("$person")))
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    DropdownButtonHideUnderline(
                      child: FormBuilderDateTimePicker(
                        attribute: "date",
                        inputType: InputType.date,
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
                          labelText: "Expected date closure",
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromRGBO(61, 61, 61, 1)),
                          icon: Icon(FontAwesomeIcons.solidCalendarAlt,color: Colors.black),
                        ),
                        initialValue: DateTime.now(),
                        onSaved: (value) {
                          debugPrint(value.toString());
                        },
                        ),
                    ),
                    const SizedBox(height: 24.0),
                    DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextFormField(
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
                              FontAwesomeIcons.hashtag,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            labelText: 'Tag',
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                            fillColor: Color(0xffD2E8E6),
                          ),
                          maxLines: 1,
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
