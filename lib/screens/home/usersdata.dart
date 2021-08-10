import 'package:examplesd/details/data.dart';
import 'package:examplesd/screens/home/userpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<List<UserData>?>(context) ?? [];
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: userData.length,
      itemBuilder: (context, index){
        return UserPage(user: userData[index]);
      },
    );
  }
}
