import 'package:examplesd/details/user.dart';
import 'package:examplesd/screens/auth/authenticate.dart';
import 'package:examplesd/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Member?>(context);
    print(user);

    //return sign in option or main screen
    if(user == null){
      return Auth();
    }else{
      return Home();
    }
  }
}
