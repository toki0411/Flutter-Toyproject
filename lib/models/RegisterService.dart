import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blackup/models/RegisterModel.dart';

class RegisterService{
  static final RegisterService _fireService = RegisterService._internal();
  factory RegisterService()=> _fireService;
  RegisterService._internal();

  //CREATE
  Future createNewPost(Map<String,dynamic> json) async{
    await FirebaseFirestore.instance.collection("register").add(json);
  }

  //READ 알림창
  Future<List<RegisterModel>> getRegisterModel(String userKey) async{
    CollectionReference<Map<String, dynamic>>collectionReference=
    FirebaseFirestore.instance.collection("register");
    QuerySnapshot<Map<String, dynamic>> querySnapshot=
    await collectionReference.orderBy("to").get();

    List<RegisterModel> postList =[];
    for(var doc in querySnapshot.docs){
      RegisterModel registerModel = RegisterModel.fromQuerySnapshot(doc);
      if(registerModel.to=="${userKey}") {
        if(registerModel.curstate==0){postList.add(registerModel);}
      }
      if(registerModel.from=="${userKey}"){
        if(registerModel.curstate==1){postList.add(registerModel);}
        else if(registerModel.curstate==2){postList.add(registerModel);}
      }
    }
    return postList;
  }
  //READ 참가신청
  Future<List<RegisterModel>> getRegisterModelCreateByMe(String userKey) async{
    CollectionReference<Map<String, dynamic>>collectionReference=
    FirebaseFirestore.instance.collection("register");
    QuerySnapshot<Map<String, dynamic>> querySnapshot=
    await collectionReference.orderBy("to").get();

    List<RegisterModel> postList =[];
    for(var doc in querySnapshot.docs){
      RegisterModel registerModel = RegisterModel.fromQuerySnapshot(doc);
      if(registerModel.to=="${userKey}") {
        if(registerModel.curstate==0){postList.add(registerModel);}
      }
    }
    return postList;
  }

  //READ 컬렉션 내 모든 데이터를 가져 올때
  Future<List<RegisterModel>> getRegisterModels()async{
    CollectionReference<Map<String, dynamic>>collectionReference=
    FirebaseFirestore.instance.collection("register");
    QuerySnapshot<Map<String, dynamic>> querySnapshot=
    await collectionReference.orderBy("to").get();

    List<RegisterModel> postList =[];
    for(var doc in querySnapshot.docs){
      RegisterModel registerModel = RegisterModel.fromQuerySnapshot(doc);
      postList.add(registerModel);
    }
    return postList;
  }

  //update
  Future updateRegisterModel({required DocumentReference reference, required Map<String,dynamic> json}) async{
    await reference.set(json);
  }
  //delete
  Future<void> deleteRegisterModel(DocumentReference reference) async{
    await reference.delete();
  }

}
