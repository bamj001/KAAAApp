import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kaaa_app/models/alumni.dart';
import 'package:kaaa_app/db/alumni_database_helper.dart';
import 'package:intl/intl.dart';

class AlumniDetail extends StatefulWidget {

  final String appBarTitle;
  final Alumni alumni;

  AlumniDetail(this. alumni, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {

    return AlumniDetailState(this.alumni, this.appBarTitle);
  }
}

class AlumniDetailState extends State<AlumniDetail> {

  AlumniDatabaseHelper helper = AlumniDatabaseHelper();

  String appBarTitle;
  Alumni alumni;

  int kingsGraduatingClass;

  TextEditingController nameController = TextEditingController();
  TextEditingController kingsGraduatingClassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController secondaryEmailController = TextEditingController();
  TextEditingController currentCityController = TextEditingController();
  TextEditingController currentCountryController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController collegeController = TextEditingController();

  AlumniDetailState(this.alumni, this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    nameController.text = alumni.name;
    emailController.text = alumni.email;
    secondaryEmailController.text = alumni.secondaryEmail;
    currentCityController.text = alumni.currentCity;
    currentCountryController.text = alumni.currentCountry;
    majorController.text = alumni.major;
    collegeController.text = alumni.college;
    kingsGraduatingClass = int.tryParse(kingsGraduatingClassController.text);
    kingsGraduatingClass = alumni.kingsGraduatingClass;

    return WillPopScope(

        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },

        child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            leading: IconButton(icon: Icon(
                Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }
            ),
          ),

          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[

                // First Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: nameController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Name Text Field');
                      updateName();
                    },
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                // Second Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                      controller: kingsGraduatingClassController,
                      onChanged: (value) {
                        debugPrint('Something changed in kings graduating class Field');
                        updateKingsGraduatingClass();
                      },
                      decoration: InputDecoration(
                          labelText: "King's Graduating Class",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                      keyboardType: TextInputType.number
                  ),
                ),

                // Third Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: emailController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in email Text Field');
                      updateEmail();
                    },
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                // Fourth Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: secondaryEmailController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in secondary email Text Field');
                      updateSecondaryEmail();
                    },
                    decoration: InputDecoration(
                        labelText: 'Secondary Email (Optional)',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                // Fifth Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: currentCountryController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in current country Text Field');
                      updateCurrentCountry();
                    },
                    decoration: InputDecoration(
                        labelText: 'Current Country',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                // Sixth Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: currentCityController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in current city Text Field');
                      updateCurrentCity();
                    },
                    decoration: InputDecoration(
                        labelText: 'Current City',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                // Seventh Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: majorController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in major Text Field');
                      updateMajor();
                    },
                    decoration: InputDecoration(
                        labelText: 'Major',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                // Eighth Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: collegeController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in college Text Field');
                      updateCollege();
                    },
                    decoration: InputDecoration(
                        labelText: 'College',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                // Ninth Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: const Color(0xff233c5f),
                          textColor: Colors.white,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button clicked");
                              _save();
                            });
                          },
                        ),
                      ),

                      Container(width: 5.0,),

                      Expanded(
                        child: RaisedButton(
                          color: const Color(0xff233c5f),
                          textColor: Colors.white,
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Delete button clicked");
                              _delete();
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),

        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Update the name of Alumni object
  void updateName(){
    alumni.name = nameController.text;
  }

  //Update the graduating class from Kings
  void updateKingsGraduatingClass() {
    alumni.kingsGraduatingClass = int.tryParse(kingsGraduatingClassController.text);
  }

  // Update the email of alumni object
  void updateEmail() {
    alumni.email = emailController.text;
  }

  // Update the secondary email of alumni object
  void updateSecondaryEmail() {
    alumni.secondaryEmail = secondaryEmailController.text;
  }

  // Update the current country of alumni object
  void updateCurrentCountry() {
    alumni.currentCountry = currentCountryController.text;
  }

  // Update the current city of alumni object
  void updateCurrentCity() {
    alumni.currentCity = currentCityController.text;
  }

  // Update the major of alumni object
  void updateMajor() {
    alumni.major = majorController.text;
  }

  // Update the college of alumni object
  void updateCollege() {
    alumni.college = collegeController.text;
  }

  // Save data to database
  void _save() async {

    moveToLastScreen();

    int result;
    if (alumni.id != null) {  // Case 1: Update operation
      result = await helper.updateAlumni(alumni);
    } else { // Case 2: Insert Operation
      result = await helper.insertAlumni(alumni);
    }

    if (result != 0) {  // Success
      _showAlertDialog('Status', 'Alumni Saved Successfully');
    } else {  // Failure
      _showAlertDialog('Status', 'Problem Saving Alumni');
    }

  }

  void _delete() async {

    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW Alumni i.e. he has come to
    // the detail page by pressing the FAB of AlumniList page.
    if (alumni.id == null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    // Case 2: User is trying to delete the old alumni that already has a valid ID.
    int result = await helper.deleteAlumni(alumni.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Alumni Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Alumni');
    }
  }

  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

}









