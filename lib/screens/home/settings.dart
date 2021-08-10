import 'package:examplesd/screens/auth/style.dart';
import 'package:examplesd/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPanel extends StatefulWidget {
  final user;
  const SettingsPanel({Key? key, this.user}) : super(key: key);

  @override
  _SettingsPanelState createState() => _SettingsPanelState();
}

class _SettingsPanelState extends State<SettingsPanel> {
  String? currentName;
  String? currentAge;
  String? currentRole;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
          child: Column(
            children: [
              Text('EDIT DETAILS'),
              SizedBox(height: 20.0,),
              TextFormField(
                initialValue: widget.user.name,
                decoration: authDecorationInput(text: 'Name'),
                validator: (val) => val!.isEmpty?'Enter a name':null,
                onChanged: (val){
                  setState(() => currentName = val);
                },
              ),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      initialValue: widget.user.role == '' ? null: widget.user.role,
                      decoration: authDecorationInput(text: 'Role'),
                      validator: (val) => val!.isEmpty?'Enter a Role':null,
                      onChanged: (val){
                        setState(() => currentRole = val);
                      },
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      initialValue: widget.user.age,
                      keyboardType: TextInputType.number,
                      decoration: authDecorationInput(text: 'Age'),
                      validator: (val) => val!.isEmpty?'Enter Age':null,
                      onChanged: (val){
                        setState(() => currentAge = val);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              TextButton(onPressed: () async{
                if(formKey.currentState!.validate()){
                  await DataBaseService(uid: widget.user.uid).updateDataBase(
                    name: currentName ?? widget.user.name,
                    age: currentAge ?? widget.user.age,
                    role: currentRole ?? widget.user.role
                  );
                  Navigator.of(context).pop();
                }
              }, child: Text('update',style: TextStyle(
                fontSize: 21.0,
                color: Colors.white
              ),),
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue[400]!)
              ),)
            ],
          )),
    );
  }
}
