import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:local_database2/pages/sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_database2/pages/sign_up.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("login_database");
  await Hive.openBox("sign_up_database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpPage(),
      routes: {
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
      },
    );
  }
}
