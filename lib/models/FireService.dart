import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blackup/models/FireModel.dart';

class FireService{
  static final FireService _fireService = FireService._internal();
  factory FireService()=> _fireService;
  FireService._internal();

  //CREATE
  Future createNewPost(Map<String,dynamic> json) async{
    await FirebaseFirestore.instance.collection("post").add(json);
  }

  //READ 각각의 데이터를 콕 집어서 가져올때
  Future<FireModel> getFireModel(String userKey) async{
    DocumentReference<Map<String, dynamic>> documentReference=
    FirebaseFirestore.instance.collection("post").doc(userKey);
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot=
    await documentReference.get();
    final fireModel=FireModel.fromSnapShot(documentSnapshot);
    return fireModel;
  }

  //READ 컬렉션 내 모든 데이터를 가져 올때
  Future<List<FireModel>> getFireModels()async{
    CollectionReference<Map<String, dynamic>>collectionReference=
        FirebaseFirestore.instance.collection("post");
    QuerySnapshot<Map<String, dynamic>> querySnapshot=
        await collectionReference.orderBy("create").get();

    List<FireModel> postList =[];
    for(var doc in querySnapshot.docs){
      FireModel fireModel = FireModel.fromQuerySnapshot(doc);
      postList.add(fireModel);
    }
    return postList;
  }

  Future<void> delFireModel(DocumentReference reference) async{
    await reference.delete();
  }
  Future<void> updateFireModel(Map<String,dynamic>json,DocumentReference reference) async{
    await reference.set(json);
  }
}

