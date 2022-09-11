import 'package:flutter/material.dart';
import 'kakao_login/kakao_login_logout.dart';
import 'kakao_login/main_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData){  //로그인 안 된 상태
              return ElevatedButton(
                onPressed: () async {
                  await viewModel.login();
                  setState(() {});
                },
                child: const Text('Login'),
              );
            }
            return Column(  //로그인 된 상태
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                    viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
                Text(
                  '${viewModel.isLogined}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await viewModel.login();
                    setState(() {});
                  },
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await viewModel.logout();
                    setState(() {});
                  },
                  child: const Text('Logout'),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}