import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart'as kakao;
import 'app.dart';
import 'kakao_login/firebase_options.dart';
import 'naver_login/a.dart';
//import 'naver_login/naver_login.dart';
import 'naver_login/naver_login_.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async{
  kakao.KakaoSdk.init(nativeAppKey: '');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(  //파이어베이스 초기화 하는 코드
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      home: app(),
    );
  }
}



