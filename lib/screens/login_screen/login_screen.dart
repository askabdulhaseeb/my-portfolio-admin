import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_admin/database/auth_methods.dart';
import 'package:portfolio_admin/screens/main_screen.dart';
import 'package:portfolio_admin/screens/widgets/customiz_text_form_field.dart';
import 'package:portfolio_admin/screens/widgets/show_loading_dislog.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomizeTextFormField(hint: 'Email', controller: _email),
            CustomizeTextFormField(
              hint: 'Password',
              controller: _password,
              isPassword: true,
            ),
            ElevatedButton(
              onPressed: () async {
                showLoadingDialog(context);
                final User? user =
                    await AuthMethods().loginWithEmailAndPassword(
                  _email.text.trim(),
                  _password.text.trim(),
                );
                Navigator.of(context).pop();
                if (user != null) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    MainScreen.routeName,
                    (route) => false,
                  );
                } else {}
              },
              child: Text('Login'),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
