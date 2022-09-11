//클래스선언
import 'package:http/http.dart' as http;
class FirebaseAuthRemoteDataSource {
  final String url = ' https://us-central1-black-up-b0203.cloudfunctions.net/createCustomToken';  //서버주소
  Future<String> createCustomToken(Map<String, dynamic> user) async {
    final customTokenResponse = await http
        .post(Uri.parse(url), body: user);  //토큰을 가져옴

    return customTokenResponse.body;
  }
}