// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart' as firebase
//     hide EmailAuthProvider, PhoneAuthProvider;
// import 'firebase_auth_remote_data_source.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:flutter_naver_login/flutter_naver_login.dart' as naver_flutter;
// class NaverLogin extends StatefulWidget {
//   const NaverLogin({super.key});
//
//   @override
//   State<NaverLogin> createState() => _NaverLoginState();
// }
//
// class _NaverLoginState extends State<NaverLogin> {
//   final _firebaseAuthSocialLogin = FirebaseAuthSocialLogin();
//
//   Future<void> signInWithNaver() async {
//     naver_flutter.NaverLoginResult result =
//     await naver_flutter.FlutterNaverLogin.logIn();
//     naver_flutter.NaverAccessToken tokenRes =
//     await naver_flutter.FlutterNaverLogin.currentAccessToken;
//
//     // 네이버 로그인은 accessToken으로 인증
//     final customToken = await _firebaseAuthSocialLogin.createCustomToken({
//       'platform': 'naver',
//       'uId': result.account.id,
//       'name': result.account.name,
//       'email': result.account.email,
//       'token': tokenRes
//     });
//     await firebase.FirebaseAuth.instance.signInWithCustomToken(customToken);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: CupertinoButton(
//           child: Text('네이버 로그인'),
//           color: Color.fromARGB(255, 12, 239, 72),
//           onPressed: () {
//             signInWithNaver();
//           }),
//     );
//     ;
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart' as naver_flutter;
import 'firebase_auth_remote_data_source.dart';

class SocialLogin {
  final _firebaseAuthSocialLogin = FirebaseAuthSocialLogin();


  // naver
  Future<User?> signInWithNaver() async {
    try {
      naver_flutter.NaverLoginResult result =
      await naver_flutter.FlutterNaverLogin.logIn();
      naver_flutter.NaverAccessToken tokenRes =
      await naver_flutter.FlutterNaverLogin.currentAccessToken;
      return await loginWithUser({'platform': 'naver', 'token': tokenRes});
    } catch (error) {
      null;
    }
    return null;
  }

  Future<User> loginWithUser(Map<String, dynamic> user) async {
    // 카카오는 uId로 인증하는듯??

    final customToken = await _firebaseAuthSocialLogin.createCustomToken(user);
    var credencial = await FirebaseAuth.instance.signInWithCustomToken(customToken);
    return credencial.user!;
  }
}