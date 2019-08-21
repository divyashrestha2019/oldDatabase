import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/material.dart';
import 'package:database/layout/data.dart';

class TypeAhead extends StatelessWidget {
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedCity;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final typeAhead =Container(height: 100.0,child: TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: this._typeAheadController,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.white, width: 0.1),
          ),
          filled: true,
          fillColor: Color(0xffD2E8E6),
          icon:  Icon(
            Icons.location_city,
            color: Colors.black,
            size: 20.0,
          ),
          labelText: 'City',
          labelStyle: TextStyle(
              fontSize: 15.0,
              height: 1.5,
              color: Color.fromRGBO(61, 61, 61, 1)),
        ),
      ),
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
          elevation: 8.0
      ),
      transitionBuilder: (context, suggestionsBox, animationController) =>
          FadeTransition(
            child: suggestionsBox,
            opacity: CurvedAnimation(
                parent: animationController,
                curve: Curves.fastOutSlowIn
            ),
          ),
      suggestionsCallback: (pattern) {
        return CitiesService.getSuggestions(pattern);
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion),
        );
      },

      onSuggestionSelected: (suggestion) {
        this._typeAheadController.text = suggestion;
      },
      validator: (value)  => (value.isEmpty) ? 'Please select a city' : null,

      onSaved: (value) => this._selectedCity = value,
    ));
    return ListView(
      children: <Widget>[
        Text('What is your favorite city?'),
        const SizedBox(height: 24.0),
        typeAhead,
        const SizedBox(height: 24.0),
        RaisedButton(
          child: Text('Submit'),
          onPressed: () {
            if (this._formKey.currentState.validate()) {
              this._formKey.currentState.save();
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Your Favorite City is ${this._selectedCity}')));
            }
          },
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
