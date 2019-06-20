import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddDeal extends StatefulWidget {
  static const String id = 'add_deal_screen';
  @override
  _AddDealState createState() => _AddDealState();
}

class _AddDealState extends State<AddDeal> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.teal.shade500,
        leading: Icon(
            Icons.arrow_back),
         title: Text('Add Deal',
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
                          labelText: 'Your Contact Name',
                        ),
                        items: ['Willem Worthwood', 'The Messsi Folower', 'Santosh Adhikari','Other']
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
                          icon: Icon(Icons.business_center),
                          labelText: 'Organization Name',
                        ),
                        items: ['Delatech', 'Arihant','Other']
                            .map((organization) => DropdownMenuItem(
                            value: organization,
                            child: Text("$organization")
                        )).toList(),
                      ),
                      const SizedBox(height: 24.0),
                      FormBuilderDropdown(
                        attribute: "owner",
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          filled: true,
                          icon: Icon(Icons.perm_identity),
                          hintText: 'Owner',
                          labelText: 'Owner',

                        ),
                        hint: Text('Select Owner'),
                        items: ['Admin', 'Manager', 'Ceo','Other']
                            .map((owner) => DropdownMenuItem(
                            value: owner,
                            child: Text("$owner")
                        )).toList(),
                      ),
                      const SizedBox(height: 24.0),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Container(
                            child: Flexible(
                              flex: 1,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  filled: true,
                                  icon: Icon(Icons.attach_money),
                                  hintText: 'Owner',
                                  labelText: 'Worth',
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Container(
                            child: Flexible(
                              flex: 1,
                              child: FormBuilderDropdown(
                                attribute: "Currency",
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric( vertical:-3.0,horizontal: 5.0),
                                  filled: true,
                                  labelText: "Currency",
                                    ),
                                hint: Text('Select Currency'),
                                items: ['NRP', 'IC', 'USD']
                                    .map((currency) => DropdownMenuItem(
                                    value: currency,
                                    child: Text("$currency")
                                )).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      FormBuilderDropdown(
                        attribute: "Pipeline",
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          filled: true,
                          icon: Icon(Icons.list),
                          hintText: 'Default',
                          labelText: 'Select Pipeline',
                        ),
                        hint: Text('Select Pipeline'),
                        items: ['Default', 'Manager', 'Ceo','Other']
                            .map((pipeline) => DropdownMenuItem(
                            value: pipeline,
                            child: Text("$pipeline")
                        )).toList(),
                      ),
                      const SizedBox(height: 24.0),
                      FormBuilderDropdown(
                        attribute: "stage",
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          filled: true,
                          icon: Icon(Icons.timeline),
                          hintText: 'Stage',
                          labelText: 'Stage',
                        ),
                        hint: Text('Lead In'),
                        items: ['Lead In', 'Lost', 'Win','Other']
                            .map((stage) => DropdownMenuItem(
                            value: stage,
                            child: Text("$stage")
                        )).toList(),
                      ),

                      const SizedBox(height: 24.0),
                      FormBuilderDateTimePicker(
                        attribute: "date",
                        inputType: InputType.date,
                        decoration:
                        InputDecoration(
                          filled: true,
                          labelText: "Expected date closure",
                          icon: Icon(Icons.calendar_today),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                            child: Text("Submit"),
                            onPressed: () {
                              _fbKey.currentState.save();
                              if (_fbKey.currentState.validate()) {
                                print(_fbKey.currentState.value);
                              }
                            },
                          ),
                          RaisedButton(
                            child: Text("Reset"),
                            onPressed: () {
                              _fbKey.currentState.reset();
                            },
                          ),
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
