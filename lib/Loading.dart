import 'dart:async';

import 'package:blackup/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'Login.dart';
import 'mainscreen.dart';


class Loading extends StatefulWidget{

  _Loading createState() => _Loading();
}

class _Loading extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1677ff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 90.0, start: 0.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 220.0,
              height: 75.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 52.0, end: 52.0),
                    Pin(size: 32.0, end: 0.0),
                    child: SvgPicture.string(
                      _svg_yl36,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 37.4, start: 66.2),
                    Pin(size: 37.4, start: 0.0),
                    child: SvgPicture.string(
                      _svg_o4gi71,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 37.4, end: 66.2),
                    Pin(size: 37.4, start: 0.0),
                    child: SvgPicture.string(
                      _svg_me32hg,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  // FirebaseAuth.instance.authStateChanges().listen((User user) {
  // if (user == null) {

  @override
  void initState() {
    var _Result=[];
    final firestore = FirebaseFirestore.instance;
    FirebaseAuth.instance.authStateChanges().listen((User? user) async{
      if (user == null) {
        Timer(Duration(milliseconds: 2000), () {
          Navigator.push(context, CupertinoPageRoute(
              builder: (context) => MyHomePage()  //로그인 페이지
          ));
        });
      } else {
        var result = await firestore.collection('profile').where("uid", isEqualTo: user.uid).get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            _Result.add(doc.data()); //모든 document 정보를 리스트에 저장.
          })
        });
        if (_Result.isNotEmpty) {
          print(_Result);
          Timer(Duration(milliseconds: 2000), () {
            Navigator.push(context, CupertinoPageRoute(
                builder: (context) => MainPage() //홈화면
            ));
          });
        }
        else {
          Timer(Duration(milliseconds: 2000), () {
            Navigator.push(context, CupertinoPageRoute(
                builder: (context) => MyPage() //홈화면
            ));
          });
        }
      }

    });
  }
}





const String _svg_yl36 =
    '<svg viewBox="0.0 86.1 229.5 64.5" ><path transform="translate(0.0, -229.69)" d="M 206.733154296875 380.355712890625 L 22.80587768554688 380.355712890625 C 10.21071243286133 380.355712890625 0 370.14501953125 0 357.5495910644531 L 0 338.650146484375 C 0 326.0546875 10.21071243286133 315.843994140625 22.80587768554688 315.843994140625 L 206.733154296875 315.843994140625 C 219.3285827636719 315.843994140625 229.539306640625 326.0546875 229.539306640625 338.650146484375 L 229.539306640625 357.5495910644531 C 229.539306640625 370.14501953125 219.3285827636719 380.355712890625 206.733154296875 380.355712890625" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_o4gi71 =
    '<svg viewBox="26.2 0.0 67.4 67.4" ><path transform="translate(-69.81, 0.0)" d="M 163.3643341064453 33.68503189086914 C 163.3643341064453 52.28824615478516 148.2835235595703 67.36905670166016 129.6802978515625 67.36905670166016 C 111.0770874023438 67.36905670166016 95.99600219726562 52.28824615478516 95.99600219726562 33.68503189086914 C 95.99600219726562 15.08181381225586 111.0770874023438 0.001000000047497451 129.6802978515625 0.001000000047497451 C 148.2835235595703 0.001000000047497451 163.3643341064453 15.08181381225586 163.3643341064453 33.68503189086914" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_me32hg =
    '<svg viewBox="129.0 0.0 67.4 67.4" ><path transform="translate(-343.95, 0.0)" d="M 540.3165893554688 33.68503189086914 C 540.3165893554688 52.28824615478516 525.2354736328125 67.36905670166016 506.6322937011719 67.36905670166016 C 488.0293579101562 67.36905670166016 472.947998046875 52.28824615478516 472.947998046875 33.68503189086914 C 472.947998046875 15.08181381225586 488.0293579101562 0.001000000047497451 506.6322937011719 0.001000000047497451 C 525.2354736328125 0.001000000047497451 540.3165893554688 15.08181381225586 540.3165893554688 33.68503189086914" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
