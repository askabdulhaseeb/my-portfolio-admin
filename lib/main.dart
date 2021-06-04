import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio_admin/screens/login_screen/login_screen.dart';
import 'package:portfolio_admin/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        MainScreen.routeName: (ctx) => MainScreen(),
      },
    );
  }
}
