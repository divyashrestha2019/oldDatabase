import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  static const String id = 'profile_screen';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _image;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Images(),
          FormBuilder(
            autovalidate: true,
            key: _fbKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 24.0),
                  DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide:
                            BorderSide(color: Colors.white, width: 0.1),
                          ),
                          filled: true,
                          icon: Icon(
                            FontAwesomeIcons.solidUser,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              height: 1.5,
                              color: Color.fromRGBO(61, 61, 61, 1)),
                          fillColor: Color(0xffD2E8E6),
                        ),
                        initialValue: 'Santosh Adhikari',
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  DropdownButtonHideUnderline(
                    child: Container(
                      child: FormBuilderDropdown(
                        attribute: "role",
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
                            FontAwesomeIcons.globeAsia,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          labelText: 'Role',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              height: 1.5,
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
                            borderSide:
                            BorderSide(color: Colors.white, width: 0.1),
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
                          fillColor: Color(0xffD2E8E6),
                        ),
                        initialValue: 'Admin',
                        maxLines: 1,
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
                            borderSide:
                            BorderSide(color: Colors.white, width: 0.1),
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
                            borderSide:
                            BorderSide(color: Colors.white, width: 0.1),
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
                        ),
                        initialValue: 'SDK Group',
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class Images extends StatefulWidget {
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  var _image;
  Future getProfile() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height:250.0,
          child: _image == null
              ? Image(
            image: AssetImage('images/profile.png'),
            fit: BoxFit.cover,
          )
              : Image.file(
            _image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          right: 100.0,
          bottom: 30.0,
          child: RaisedButton(
            onPressed: getProfile,
            child: Text('Choose a File',style: TextStyle(color: Colors.white),),
            color: Color.fromRGBO(16, 143, 135, 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        )
      ],

    );
  }
}
