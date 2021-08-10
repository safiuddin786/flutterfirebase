import 'package:examplesd/details/data.dart';
import 'package:examplesd/screens/home/usersdata.dart';
import 'package:examplesd/services/auth.dart';
import 'package:examplesd/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserData>?>.value(
      value: DataBaseService().userData,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('MyApp', style: TextStyle(
            color: Colors.blueGrey[200]
          ),),
          backgroundColor: Colors.purple[900],
          elevation: 0.0,
          centerTitle: true,
          actions: [
            TextButton.icon(
                onPressed: () async {
                  await auth.signOut();
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.redAccent[100],
                ),
                label: Text(
                  'LogOut',
                style: TextStyle(
                  color: Colors.redAccent[100]
                ),))
          ],
        ),
        body: UserList(),
      ),
    );
  }
}
