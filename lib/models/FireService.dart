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

  //READ
  Future<List<FireModel>> getFireModel(String userKey) async{
    CollectionReference<Map<String, dynamic>>collectionReference=
    FirebaseFirestore.instance.collection("post");
    QuerySnapshot<Map<String, dynamic>> querySnapshot=
    await collectionReference.orderBy("create").get();

    List<FireModel> postList =[];
    for(var doc in querySnapshot.docs){
      FireModel fireModel = FireModel.fromQuerySnapshot(doc);
      if(fireModel.category=="${userKey}") {
        postList.add(fireModel);
      }
    }
    return postList;
  }
  //내가 작성한 글 불러오기
  Future<List<FireModel>> getFireModelCreateByMe(String userKey) async{
    CollectionReference<Map<String, dynamic>>collectionReference=
    FirebaseFirestore.instance.collection("post");
    QuerySnapshot<Map<String, dynamic>> querySnapshot=
    await collectionReference.orderBy("create").get();

    List<FireModel> postList =[];
    for(var doc in querySnapshot.docs){
      FireModel fireModel = FireModel.fromQuerySnapshot(doc);
      if(fireModel.create=="${userKey}") {
        postList.add(fireModel);
      }
    }
    return postList;
  }
  //내가 참여한 중인 글 불러오기
  Future<List<FireModel>> getFireModelParticipating(String userKey) async{
    CollectionReference<Map<String, dynamic>>collectionReference=
    FirebaseFirestore.instance.collection("post");
    QuerySnapshot<Map<String, dynamic>> querySnapshot=
    await collectionReference.orderBy("create").get();

    List<FireModel> postList =[];
    for(var doc in querySnapshot.docs){
      FireModel fireModel = FireModel.fromQuerySnapshot(doc);
      if(fireModel.curstate==1) {
        for(int i=0; i<fireModel.participants.length;i++){
          if(fireModel.participants[i]=="${userKey}") {
            postList.add(fireModel);
          }
        }
      }
    }
    return postList;
  }
  //내가 참여완료한 글 불러오기
  Future<List<FireModel>> getFireModelParticipated(String userKey) async{
    CollectionReference<Map<String, dynamic>>collectionReference=
    FirebaseFirestore.instance.collection("post");
    QuerySnapshot<Map<String, dynamic>> querySnapshot=
    await collectionReference.orderBy("create").get();

    List<FireModel> postList =[];
    for(var doc in querySnapshot.docs){
      FireModel fireModel = FireModel.fromQuerySnapshot(doc);
      if(fireModel.curstate==0) {
        for(int i=0; i<fireModel.participants.length;i++){
          if(fireModel.participants[i]=="${userKey}") {
            postList.add(fireModel);
          }
        }
      }
    }
    return postList;
  }

  Future<List<FireModel>> get_FireModel() async{
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

  //update
  Future updateFireModel({required DocumentReference reference, required Map<String,dynamic> json}) async{
    await reference.set(json);
  }
  //delete
  Future<void> delFireModel(DocumentReference reference) async{
    await reference.delete();
  }

}
