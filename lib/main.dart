import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/pages/add_developer/add_developer.dart';
import 'screens/pages/add_project/add_project.dart';
import 'screens/pages/add_project_type/add_project_type.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddProject(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        MainScreen.routeName: (ctx) => MainScreen(),
        AddDeveloper.routeName: (ctx) => AddDeveloper(),
        AddProjectType.routeName: (ctx) => AddProjectType(),
        AddProject.routeName: (ctx) => AddProject(),
      },
    );
  }
}
