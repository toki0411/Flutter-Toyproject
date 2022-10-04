import 'package:crew_app/loginPage/login.dart';
import 'package:crew_app/makepage/makepage.dart';
import 'package:flutter/material.dart';
import 'calendier/calendier.dart';
import 'mainPage/mainPage.dart';
import 'mypage/myPage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///** 달력 언어지정 부분 **//
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ko')
      ],
      debugShowCheckedModeBanner: false,
      home: MakePage(),
    );
  }
}
