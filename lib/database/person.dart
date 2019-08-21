class Person {
  int _id;
  String _name;
  String _organization;
  String _email;
  String _phone;
  String _city;
  String _country;

  Person(this._name,this._organization, this._email, this._phone, this._city, this._country);
  Person.withID(this._id, this._name, this._organization, this._email, this._phone,
      this._city, this._country);

  int get id => _id;

  String get name => _name;

  String get organization => _organization;

  String get email =>
      _email;

  String get phone => _phone;

  String get city => _city;

  String get country => _country;

  set name(String newName) {
    if (newName.length <= 255) {
      this._name = newName;
    }
  }

  set organization(String newOrg) {
    if (newOrg.length <= 255) {
      this._organization = newOrg;
    }
  }

  set email(String newEmail) {
    if (newEmail.length <= 255) {
      this._email = newEmail;
    }
  }

  set phone(String newPhone) {
    if (newPhone.length <= 15) {
      this._phone = newPhone;
    }
  }

  set city(String newCity) {
    if (newCity.length <= 20) {
      this._city = newCity;
    }
  }

  set country(String newCountry) {
    if (newCountry.length <= 255) {
      this._country = newCountry;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['organization'] = _organization;
    map['email'] = _email;
    map['phone'] = _phone;
    map['city'] = _city;
    map['country'] = _country;

    return map;
  }

// Extract a Note object from a Map object
  Person.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this. _organization = map['organization'];
    this._email = map['email'];
    this._phone = map['phone'];
    this._city = map['city'];
    this._country = map['country'];
  }
}
