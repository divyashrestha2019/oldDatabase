import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

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
        backgroundColor: Colors.teal.shade500,
        leading: Icon(Icons.arrow_back),
        title: Text(
          'Profile',
          style: TextStyle(),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'SAVE',
                style: TextStyle(
                  inherit: true,
                  fontSize: 20.0,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                     child: _image == null ? Image(image: AssetImage('images/profile.png')):
                     Image.file(_image,width: 400.0,height: 250.0,fit: BoxFit.cover,),
                  ),

                  FloatingActionButton(
                    onPressed: getImage,
                    tooltip: 'Pick Image',
                    child: Icon(Icons.add_a_photo),
                  )
                ],
              ),
              FormBuilder(
                autovalidate: true,
                key: _fbKey,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      attribute: "name",
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        filled: true,
                        icon: Icon(Icons.person),
                        labelText: 'Name',
                        hintText: 'Santosh Adhikari',
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    FormBuilderDropdown(
                      attribute: "ROLE",
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        filled: true,
                        icon: Icon(Icons.control_point),
                        labelText: 'Role',
                      ),
                      hint: Text('Admin'),
                      items: ['Admin', 'Staff', 'Customer', 'Others']
                          .map((role) => DropdownMenuItem(
                              value: role, child: Text("$role")))
                          .toList(),
                    ),
                    const SizedBox(height: 24.0),
                    FormBuilderTextField(
                      attribute: "email",
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        filled: true,
                        icon: Icon(Icons.email),
                        labelText: 'Email address',
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    FormBuilderTextField(
                      attribute: "phone",
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        filled: true,
                        icon: Icon(Icons.phone),
                        labelText: 'Phone Number',
                      ),
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
                      items: ['SDF Group', 'Arihant', 'Other']
                          .map((organization) => DropdownMenuItem(
                              value: organization,
                              child: Text("$organization")))
                          .toList(),
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
