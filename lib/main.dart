import 'package:examplesd/details/user.dart';
import 'package:examplesd/screens/home/login.dart';
import 'package:examplesd/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Member?>.value(
      value: AuthServices().user,
      initialData: null,
      child: MaterialApp(
        title: 'stful',
        home: LogIn(),
      ),
    );
  }
}
