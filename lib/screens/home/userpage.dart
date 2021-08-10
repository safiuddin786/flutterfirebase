import 'package:examplesd/details/user.dart';
import 'package:examplesd/screens/home/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  final user;
  const UserPage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late bool? isUser;
    final mainUser = Provider.of<Member?>(context);
    if(mainUser!.uid == user.uid) isUser = true;
    else isUser = false;
    void showSettings() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: SettingsPanel(user: user),
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        tileColor: Colors.grey[900],
        leading: CircleAvatar(
          child: Icon(Icons.person),
          backgroundColor: Colors.blueGrey[500],
        ),
        title: Text(
          user.name,
          style: TextStyle(fontSize: 21.0, color: Colors.purple[100]),
        ),
        subtitle: Text(
          'Age : ${user.age}',
          style: TextStyle(fontSize: 18.0, color: Colors.purple[200]),
        ),
        trailing: Column(
          children: [
            user.role != ''?Expanded(
              child: Text('Role : ${user.role}',
                  style:
                  TextStyle(fontSize: 18.0, color: Colors.purple[200])),
            ):Text(''),
            isUser?Expanded(
              child: IconButton(
                onPressed: () => showSettings(),
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
              ),
            ):Text('')
          ],
        ),
      ),
    );
  }
}