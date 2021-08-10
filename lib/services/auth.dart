import 'dart:async';

import 'package:examplesd/details/user.dart';
import 'package:examplesd/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Member? userFromFirebase(User? user){
    return user != null ? Member(uid: user.uid) : null;
  }
  //authentication stream
  Stream<Member?> get user{
    return auth.authStateChanges()
        .map(userFromFirebase);
  }

  //Anonymous Signin
  Future anonymSignIn() async{
    try{
      UserCredential result = await auth.signInAnonymously();
      User? user = result.user;
      return userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future emailRegister(String email, String password) async{
    try{
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      //create database for user
      await DataBaseService(uid: user!.uid).updateDataBase(name: 'Akram',age: '21',role:'');
      return userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //signIn with email and password
  Future emailSignIn(String email, String password) async{
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}