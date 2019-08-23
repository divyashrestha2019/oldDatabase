import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
//import 'dart:convert';

class Profile extends StatefulWidget {
  static const String id = 'profile_screen';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var _image;
  String _name;
  String _email;
  String _orgName;
  String _phone;
  String _token;
  String _role;

  void initState() {
    super.initState();
    _getDetail();
  }

    _getDetail() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _email = _sharedPreferences.getString('email');
      _name = _sharedPreferences.getString('name');
      _orgName = _sharedPreferences.getString('orgName');
      _phone = _sharedPreferences.getString('phone');
      _token = _sharedPreferences.getString('token');
      _role = _sharedPreferences.getString('role');

    });
  }
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  //api save profile data
  Future _save() async {
    final response = await http.post(
        "http://leadmgmtv2.deltatech.com.np/api/update-user",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer " + _token.toString()
        },
        body: {"name": nameController.text,
          "phone": phoneController.text});

    print("Update Response" + response.body);
    if (response.statusCode == 200) {
      _showAlertDialog('Success', 'Update Profile successfully');
    }
    else {
      _showAlertDialog('Failed !', 'Problem on updation');
    }
  }

  
  @override
  Widget build(BuildContext context) {

    nameController.text = _name;
    emailController.text = _email;
    phoneController.text = _phone;
    organizationController.text = _orgName;
    roleController.text = _role;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(16, 143, 135, 1),
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context,true);},),
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
              onTap: () {
                _save();
              },
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
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextFormField(
                      controller: roleController,
                      enabled: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide:
                          BorderSide(color: Colors.white, width: 0.1),
                        ),
                        filled: true,
                        icon: Icon(
                          FontAwesomeIcons.globeAsia,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        labelText: 'Role ',
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            height: 1.5,
                            color: Color.fromRGBO(61, 61, 61, 1)),
                        fillColor: Color(0xffD2E8E6),
                      ),

                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextFormField(
                      controller: emailController,
                      enabled: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        disabledBorder: OutlineInputBorder(
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
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        //debugPrint('Something changed in Name Text Field');
                        updatePhone();
                      },
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
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextFormField(
                      enabled: false,
                      controller: organizationController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        disabledBorder: OutlineInputBorder(
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
  void updateName()  {
    _name = nameController.text;
  }
  void updatePhone()  {
    _phone = phoneController.text;
  }


_showAlertDialog(String title, String message) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title,style: TextStyle(color: Colors.teal),),
    content: Text(message,style: TextStyle(color: Colors.tealAccent),),
  );
  showDialog(context: context, builder: (_) => alertDialog);
}

}
class Images extends StatefulWidget {
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  var _image;
  String _apiImage;
  String _token;

  initState () {
    super.initState();
    _getImage();
  }
  Future getProfile() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      _saveImage();
    });
  }
  /*Future _saveImage() async {
    final response = await http.post("http://leadmgmtv2.deltatech.com.np/api/update-profile-picture",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " + _token.toString()
      },
      body: {
    'picture': _image != null ? 'data:image/png;base64,' +
    base64Encode(_image.readAsBytesSync()) : '',
    },
    );
    print("Status O Response" + response.body);
    if(response.statusCode == 200)
      {
        print('');
      }
    else {
      print('error');
    }
  }*/
  Future _saveImage() async {
    String apiUrl = 'http://leadmgmtv2.deltatech.com.np/api/update-profile-picture';
    final length = await _image.length();
    final request = new http.MultipartRequest('POST', Uri.parse(apiUrl))
      ..files.add(new http.MultipartFile('picture', _image.openRead(), length));
    request.headers[HttpHeaders.authorizationHeader] =  "Bearer " + _token.toString();
    http.Response response = await http.Response.fromStream(await request.send());
    print("Result: ${response.body}");
    //return json.decode(response.body);
  }
  _getImage() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _apiImage = _sharedPreferences.getString('image');
      _token =_sharedPreferences.getString('token');
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
            image: NetworkImage('http://leadmgmtv2.deltatech.com.np/storage/app/public/avatar/'+_apiImage.toString()),
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
