import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddActivity extends StatefulWidget {
  static const String id = 'add_activity_screen';
  @override
  _AddActivityState createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  static final formColor = Color(0xffD2E8E6);
  static final backColor = Color.fromRGBO(16, 143, 135, 1);
  bool _isChecked= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backColor,
        leading: Icon(Icons.arrow_back),
        title: Text(
          'Add Activity',
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
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 17.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                              BorderSide(color: Colors.white, width: 0.1),
                            ),
                            filled: true,
                            fillColor: Color(0xffD2E8E6),
                            icon: SizedBox(
                              width: 22.0,
                              child: Checkbox(value: _isChecked, onChanged: (bool value){
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                                materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            labelText: 'Call',
                            alignLabelWithHint: true,
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                          ),
                          initialValue: 'Call to KCBL',
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
                          labelText: "Date",
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromRGBO(61, 61, 61, 1)),
                          icon: Icon(FontAwesomeIcons.clock ,
                            color: Colors.black,size: 20.0,),
                        ),
                        initialValue: DateTime.now(),
                        onSaved: (value) {
                          debugPrint(value.toString());
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:35.0),
                      child: Row(
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Container(
                            child: Flexible(
                              flex: 1,
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0,top: 20.0,bottom: 20.0),
                                  child: FormBuilderDateTimePicker(
                                    attribute: 'time',
                                    inputType: InputType.time,
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
                                      labelText: 'Time',
                                      labelStyle: TextStyle(
                                          fontSize: 18.0,
                                          color: Color.fromRGBO(61, 61, 61, 1)),
                                      fillColor: Color(0xffD2E8E6),
                                    ),
                                    initialValue: DateTime.now(),
                                    onSaved: (value) {
                                      debugPrint(value.toString());
                                    },
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
                                  child: TextFormField(
                                    decoration: InputDecoration(
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
                                      fillColor: Color(0xffD2E8E6),
                                      labelText: 'Duration',
                                      labelStyle: TextStyle(
                                          fontSize: 18.0,
                                          color: Color.fromRGBO(61, 61, 61, 1)),
                                    ),
                                    initialValue: '50 min',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 35.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                  color: Colors.white, width: 0.1),
                            ),
                            filled: true,
                            icon: Icon(
                              FontAwesomeIcons.edit,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            labelText: 'Test message Note',
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                            fillColor: Color(0xffD2E8E6),
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    DropdownButtonHideUnderline(
                      child: Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 17.0),
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
                              FontAwesomeIcons.solidCircle ,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            labelText: 'Assigned to',
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                          ),
                          initialValue: 'Admin',
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    DropdownButtonHideUnderline(
                      child: Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 27.0),
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
                              FontAwesomeIcons.server ,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            labelText: 'Link Activity to',
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(61, 61, 61, 1)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.only(left:35.0),
                        child: Container(
                          child: FormBuilderDropdown(
                            attribute: "corporation",
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
                            ),
                            initialValue: 'Abc Corporation',
                            items: ['Abc Corporation', 'Deltatech Nepal', 'Other']
                                .map((person) => DropdownMenuItem(
                                value: person, child: Text("$person")))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
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
