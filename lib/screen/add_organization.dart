import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AddOrganization extends StatefulWidget {
  static const String id = 'add_organization_screen';

  @override
  _AddOrganizationState createState() => _AddOrganizationState();
}

class _AddOrganizationState extends State<AddOrganization>
    with SingleTickerProviderStateMixin {
  List<Widget> _emailWidgets = List<Widget>();
  List<Widget> _phoneWidgets = List<Widget>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  List<String> allCities = [ 'Biratnagar','Itahari', 'Chainpur','Kathmandu','Pokhara', 'Kharang','Panighatta','Lalitpur','Bharatpur'];

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  void initState() {
    super.initState();
  }

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  Country _selected;

  @override
  Widget build(BuildContext context) {
    final organization = Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
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
    );
    final email = Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
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
    );
    final phone = Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
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
        initialValue: '9829326110',
        maxLines: 1,
      ),
    );
    final addEmail = Padding(
      padding: const EdgeInsets.only(left: 31.0),
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
      padding: const EdgeInsets.only(left: 31.0),
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
              _phoneWidgets.add(Phone(
                fieldName: 'Phone Number',
              ));
            });
          },
          color: Colors.white,
        ),
      ),
    );
    final country = CountryPicker(
      dense: false,
      showFlag: true, //displays flag, true by default
      showDialingCode: false, //displays dialing code, false by default
      showName: true, //displays country name, true by default
      onChanged: (Country country) {
        setState(() {
          _selected = country;
        });
      },
      selectedCountry: _selected,
    );
    final newCity = Container(height: 100.0, child : FormBuilderTypeAhead(
      initialValue: "",
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
            FontAwesomeIcons.mapMarked,
            color: Colors.black,
            size: 20.0,
          ),
          hintText: 'City',
          hintStyle: TextStyle(
              fontSize: 15.0,
              height: 1.5,
              color: Color.fromRGBO(61, 61, 61, 1)),
        ),
      textFieldConfiguration: TextFieldConfiguration(maxLines: 2),
      attribute: 'newCity',
      //onChanged: _onChanged,
      itemBuilder: (context, city) {
        return ListTile(
          title: Text(city),
        );
      },
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
          elevation: 1.0
      ),
      transitionBuilder: (context, suggestionsBox, animationController) =>
          FadeTransition(
            child: suggestionsBox,
            opacity: CurvedAnimation(
                parent: animationController,
                curve: Curves.fastOutSlowIn
            ),
          ),
      suggestionsCallback: (query) {
        if (query.length != 0) {
          var lowercaseQuery = query.toLowerCase();
          return allCities.where((city) {
            return city.toLowerCase().contains(lowercaseQuery);
          }).toList(growable: false)
            ..sort((a, b) => a
                .toLowerCase()
                .indexOf(lowercaseQuery)
                .compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
        } else {
          return allCities;
        }
      },
    ));


    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
        Scaffold(
          key: _scaffold,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(0xff108F87),
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Add Organization',
              style: TextStyle(fontSize: 18.0),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                  right: 12.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    _fbKey.currentState.save();
                    if (_fbKey.currentState.validate()) {
                      print(_fbKey.currentState.value);
                      _validateInputs();
                    }
                  },
                  child: Text(
                    'SAVE',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
          body: Center(
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: false,
                  //padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  children: [
                    const SizedBox(height: 24.0),
                    organization,
                    const SizedBox(height: 24.0),
                    email,
                    const SizedBox(height: 24.0),
                    addEmail,
                    Column(
                      children: List.generate(_emailWidgets.length, (i) {
                        return _emailWidgets[i];
                      }),
                    ),
                    const SizedBox(height: 24.0),
                    phone,
                    const SizedBox(height: 24.0),
                    addPhone,
                    Column(
                      children: List.generate(_phoneWidgets.length, (i) {
                        return _phoneWidgets[i];
                      }),
                    ),
                    const SizedBox( height: 24.0),
                    country,
                    const SizedBox(height: 24.0),
                    newCity,
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      // If all data are correct then save data to the variables
      _formKey.currentState.save();
      _save();
    } else {
      // If all data are not valid then start auto validation
      setState(() {
        _autoValidate = true;
      });
    }
  }

  _save() {}
}

class Email extends StatelessWidget {
  String fieldName;
  Email({this.fieldName = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
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
          labelText: fieldName,
          labelStyle: TextStyle(
              fontSize: 15.0,
              height: 1.5,
              color: Color.fromRGBO(61, 61, 61, 1)),
          fillColor: Color(0xffD2E8E6),
        ),
        maxLines: 1,
      ),
    );
  }
}

class Phone extends StatelessWidget {
  String fieldName;
  Phone({this.fieldName = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
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
          labelText: fieldName,
          labelStyle: TextStyle(
              fontSize: 15.0,
              height: 1.5,
              color: Color.fromRGBO(61, 61, 61, 1)),
          fillColor: Color(0xffD2E8E6),
        ),
        maxLines: 1,
      ),
    );
  }
}

