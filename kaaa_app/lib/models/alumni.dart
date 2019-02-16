
class Alumni {

  int _id;
  String _name;
  int _kingsGraduatingClass;
  String _email;
  String _secondaryEmail;
  String _currentCity;
  String _currentCountry;
  String _major;
  String _college;

  Alumni(this._name, this._kingsGraduatingClass, this._email, this._currentCity, this._currentCountry, this._major, this._college, [this._secondaryEmail]);

  Alumni.withId(this._id, this._name, this._kingsGraduatingClass, this._email, this._currentCity, this._currentCountry, this._major, this._college, [this._secondaryEmail]);

  int get id => _id;

  String get name => _name;

  int get kingsGraduatingClass => _kingsGraduatingClass;

  String get email => _email;

  String get secondaryEmail => _secondaryEmail;

  String get currentCity => _currentCity;

  String get currentCountry => _currentCountry;

  String get major => _major;

  String get college => _college;

  set name(String newName) {
    if (newName.length <= 255) {
      this._name = newName;
    }
  }

  set currentCity(String newCurrentCity) {
    if (newCurrentCity.length <= 255) {
      this._currentCity = newCurrentCity;
    }
  }

  set currentCountry(String newCurrentCountry) {
    if (newCurrentCountry.length <= 255) {
      this._currentCountry = newCurrentCountry;
    }
  }

  set major(String newMajor) {
    if (newMajor.length <= 255) {
      this._major = newMajor;
    }
  }

  set college(String newCollege) {
    if (newCollege.length <= 255) {
      this._college = newCollege;
    }
  }

  set email(String newEmail) {
    if(newEmail.length <= 255) {
      this._email = newEmail;
    }
  }

  set secondaryEmail(String newSecondaryEmail) {
    if(newSecondaryEmail.length <= 255) {
      this._secondaryEmail = newSecondaryEmail;
    }
  }

  set kingsGraduatingClass(int newKingsGraduatingClass) {
    if (newKingsGraduatingClass >= 2010 ) {
      this._kingsGraduatingClass = newKingsGraduatingClass;
    }
  }

  // Convert a Alumni object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['kingsGraduatingClass'] = _kingsGraduatingClass;
    map['email'] = _email;
    map['secondaryEmail'] = _secondaryEmail;
    map['currentCity'] = _currentCity;
    map['currentCountry'] = _currentCountry;
    map['major'] = _major;
    map['college'] = _college;

    return map;
  }

  // Extract an Alumni object from a Map object
  Alumni.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._kingsGraduatingClass = map['kingsGraduatingClass'];
    this._email = map['email'];
    this._secondaryEmail = map['secondaryEmail'];
    this._currentCity = map['currentCity'];
    this._currentCountry = map['currentCountry'];
    this._major = map['major'];
    this._college = map['college'];
  }
}








