import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:blackup/naver_login/social_login_naver.dart';

class NaverLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      await FlutterNaverLogin.logIn();
      return true;
    }catch(e){
      return false;
    }
  }

    @override
    Future<bool> logout() async {
      try {
        await FlutterNaverLogin.logOut();
        return true;
      } catch (error) {
        return false;
      }
    }
}

