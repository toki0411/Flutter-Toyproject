//유저 정보를 가져옴
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_remote_data_source.dart';
import 'package:blackup/kakao_login/social_login_kakao.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart'as kakao;

class MainViewModel {
  final _firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
  final SocialLogin _socialLogin;
  bool isLogined = false;
  kakao.User? user;

  MainViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await kakao.UserApi.instance.me();

      final token = await _firebaseAuthDataSource.createCustomToken({
        //파이어베이스 어스에서 필요로 하는 데이터들을 보내줌, 이미 로그인은 완료된 상태 카카오에서는 int로 아이디를 주지만, 파베에서는 문자로 아이디를 취급함
        'uid': user!.id.toString(),
        'displayName': user!.kakaoAccount!.profile!.nickname,
        'email': user!.kakaoAccount!.email!,
      });

      await FirebaseAuth.instance.signInWithCustomToken(token);  //파이어베이스와 연결
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    await FirebaseAuth.instance.signOut();
    isLogined = false;
    user = null;
  }
}