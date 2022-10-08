import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
// create "psm"
// date "1"
// female "1"
// male "1"
// image "1"
// people "1"
// place "1"
// title "1"
// totalpeople "2"
class FireModel{
  FireModel({
    this.create, //생성자
    this.date,   //모집일
    this.female, // 여자
    this.male,   // 남자
    this.image,  // image 주소?
    this.people, // 현재 인원수
    this.place,  // 모임장소
    this.title,  // 제목
    this.contents,  //내용
    this.age,    // 나이 범위
    this.totalPeople,required // 총 인원수
    this.category, // 장르
    required this.reference, //레퍼런스?
  });
  dynamic create;
  dynamic female;
  dynamic male;
  dynamic image;
  dynamic date;
  dynamic people;
  dynamic place;
  dynamic title;
  dynamic contents;
  dynamic totalPeople;
  dynamic category;
  dynamic age;
  dynamic dateAt=DateTime.now();
  dynamic reference;


  FireModel.fromJson(dynamic json,this.reference){
    create = json['create'];
    female = json['female'];
    male= json['male'];
    image= json['image'];
    date= json['date'];
    people= json['people'];
    place= json['place'];
    title= json['title'];
    contents=json['contents'];
    totalPeople= json['totalPeople'];
    dateAt= json['dateAt'];
    category=json['category'];
    age=json['age'];
  }
  FireModel.fromSnapShot(DocumentSnapshot<Map<dynamic,dynamic>>snapshot)
  : this.fromJson(snapshot.data(), snapshot.reference);
    FireModel.fromQuerySnapshot(
        QueryDocumentSnapshot<Map<String,dynamic>> snapshot)
        : this.fromJson(snapshot.data(), snapshot.reference);
    Map<String,dynamic>toJson(){
      final map=<String,dynamic>{};
      map['create']=create;
      map['female']=female;
      map['male']=male;
      map['image']=image;
      map['date']=date;
      map['people']=people;
      map['place']=place;
      map['title']=title;
      map['contents']=contents;
      map['category'] = category;
      map['dateAt'] = dateAt;
      map['totalPeople']=totalPeople;
      map['age'] = age;
      return map;
    }
}