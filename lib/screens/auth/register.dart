import 'package:examplesd/screens/auth/style.dart';
import 'package:examplesd/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function? toggleRegister;
  const Register({Key? key, this.toggleRegister}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices auth = AuthServices();
  String email = '';
  String password = '';
  String error = '';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'SignUp',
          style: TextStyle(color: Colors.blue[300]),
        ),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleRegister!();
            },
            icon: Icon(Icons.person, color: Colors.green[300]),
            label: Text(
              'LogIn',
              style: TextStyle(color: Colors.green[300]),
            ),
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: authDecorationInput(text: 'Email'),
                    validator: (val) => val!.isEmpty ? "Enter the email":null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: authDecorationInput(text: 'Password'),
                    validator: (val) => val!.length < 8 ? "Enter password with 8 or more Chars": null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                    onPressed: () async {
                      if(formKey.currentState!.validate()){
                        dynamic result = await auth.emailRegister(email, password);
                        if(result == null){
                          setState(() => error = 'enter a valid email');
                        }
                      }
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey[900]!)),
                  ),
                  SizedBox(height: 20.0),
                  Text(error, style: TextStyle(
                    color: Colors.red,
                    fontSize: 21.0
                  ),)
                ],
              ))),
    );
  }
}
