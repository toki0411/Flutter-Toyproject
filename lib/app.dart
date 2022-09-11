import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Loading.dart';


class app extends StatelessWidget {
  app({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("firebase load fail"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Loading();
        }
        return CircularProgressIndicator();
      },
    );
  }
}