import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel{
  ProfileModel({
    this.age,
    this.facebook,
    this.gender,
    this.image,
    this.instagram,
    this.introduce,
    this.name,
    this.naverblog,
    this.twitter,
    this.uid,
    required this.reference, //레퍼런스
  });
  dynamic age;
  dynamic facebook;
  dynamic gender;
  dynamic image;
  dynamic instagram;
  dynamic introduce;
  dynamic name;
  dynamic naverblog;
  dynamic twitter;
  dynamic uid;
  //dynamic reference;
  DocumentReference? reference;

  //json -> object로 firestore에서 불러올 때
  ProfileModel.fromJson(dynamic json,this.reference){
    age = json['age'];
    facebook = json['facebook'];
    gender= json['gender'];
    image= json['image'];
    instagram= json['instagram'];
    name= json['name'];
    naverblog= json['naverblog'];
    twitter= json['twitter'];
    uid=json['uid'];
    introduce= json['introduce'];
  }
  //특정한 자료를 받아올 때
  ProfileModel.fromSnapShot(DocumentSnapshot<Map<dynamic,dynamic>>snapshot)
      : this.fromJson(snapshot.data(), snapshot.reference);

  //컬렉션 내에 특정 조건을 만족하는 데이터를 다 가지고 올 때
  ProfileModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String,dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.reference);

  //object -> json, firestore에 저장할 때
  Map<String,dynamic>toJson(){
    final map=<String,dynamic>{};
    map['age']=age;
    map['facebook']=facebook;
    map['gender']=gender;
    map['image']=image;
    map['instagram']=instagram;
    map['introduce']=introduce;
    map['name']=name;
    map['naverblog']=naverblog;
    map['twitter']=twitter;
    map['uid'] = uid;
    return map;
  }
}
