import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examplesd/details/data.dart';

class DataBaseService{
  final CollectionReference exCollection = FirebaseFirestore.instance.collection('example');
  final uid;
  DataBaseService({this.uid});

  //  update database
  Future updateDataBase({String? name,String? age, String? role}) async{
    return await exCollection.doc(uid).set({
      'Name': name,
      'Age': age,
      'Role': role
    });
  }

  //usersData
  List<UserData> getUsers(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      dynamic data = doc.data();
      dynamic uids = doc.id;
      return UserData(
        uid: uids ?? '',
        name: data['Name'] ?? '',
        age: data['Age'] ?? '',
        role: data['Role'] ?? ''
      );
    }).toList();
}

  //  stream firestore
  Stream<List<UserData>> get userData{
    return exCollection.snapshots().map(getUsers);
  }
}