import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterModel{
  RegisterModel({
    this.from, //참여신청자
    this.to,   //참여받는 사람 (글쓴이)
    this.title, //제목
    this.contents, // 신청 내용
    this.curstate, // 현재 상태 (0 : 참여신청, 1 : 요청수락, 2 : 요청거절),
    this.fromname,
    this.fromprofileimage,
    required this.reference, //레퍼런스
  });
  dynamic from;
  dynamic to;
  dynamic title;
  dynamic contents;
  dynamic curstate;
  dynamic fromname;
  dynamic fromprofileimage;
  dynamic dateAt=DateTime.now();
  DocumentReference? reference;

  //json -> object로 firestore에서 불러올 때
  RegisterModel.fromJson(dynamic json,this.reference){
    from = json['from'];
    to = json['to'];
    title= json['title'];
    contents=json['contents'];
    curstate= json['curstate'];
    fromname=json['fromname'];
    fromprofileimage=json['fromprofileimage'];
    dateAt= json['dateAt'];
  }
  //특정한 자료를 받아올 때
  RegisterModel.fromSnapShot(DocumentSnapshot<Map<dynamic,dynamic>>snapshot)
      : this.fromJson(snapshot.data(), snapshot.reference);

  //컬렉션 내에 특정 조건을 만족하는 데이터를 다 가지고 올 때
  RegisterModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String,dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.reference);

  //object -> json, firestore에 저장할 때
  Map<String,dynamic>toJson(){
    final map=<String,dynamic>{};
    map['from']=from;
    map['to']=to;
    map['title']=title;
    map['contents']=contents;
    map['curstate'] = curstate;
    map['fromname']=fromname;
    map['fromprofileimage']=fromprofileimage;
    map['dateAt'] = dateAt;
    return map;
  }
}