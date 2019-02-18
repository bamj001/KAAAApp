import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kaaa_app/models/alumni.dart';
import 'package:kaaa_app/db/alumni_database_helper.dart';
import 'package:kaaa_app/screens/alumni_detail.dart';
import 'package:sqflite/sqflite.dart';


class AlumniList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return AlumniListState();
  }
}

class AlumniListState extends State<AlumniList> {

  AlumniDatabaseHelper databaseHelper = AlumniDatabaseHelper();
  List<Alumni> alumniList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if (alumniList == null) {
      alumniList = List<Alumni>();
      updateListView();
    }

    return Scaffold(

      appBar: AppBar(
        title: Text('Alumni List'),
      ),

      body: getAlumniListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Alumni('',2010, '','','','',''), 'Add Alumni');
        },

        tooltip: 'Add Alumni',

        child: Icon(Icons.add),

      ),
    );
  }

  ListView getAlumniListView() {

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(

            leading: const Icon(Icons.account_circle),

            title: Text(this.alumniList[position].name, style: titleStyle,),

            subtitle: Text("Class of " + this.alumniList[position].kingsGraduatingClass.toString()),

            trailing: GestureDetector(
              child: Icon(Icons.location_on, color: const Color(0xffa29061)),
              onTap: () {
                _delete(context, alumniList[position]);
              },
            ),


            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.alumniList[position],'Edit Alumni');
            },

          ),
        );
      },
    );
  }

  void _delete(BuildContext context, Alumni Alumni) async {

    int result = await databaseHelper.deleteAlumni(Alumni.id);
    if (result != 0) {
      _showSnackBar(context, 'Alumni Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Alumni Alumni, String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AlumniDetail(Alumni, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {

    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<Alumni>> AlumniListFuture = databaseHelper.getAlumniList();
      AlumniListFuture.then((AlumniList) {
        setState(() {
          this.alumniList = AlumniList;
          this.count = AlumniList.length;
        });
      });
    });
  }
}






