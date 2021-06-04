import 'package:flutter/material.dart';
import 'package:portfolio_admin/screens/widgets/customiz_text_form_field.dart';

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
            CustomizeTextFormField(hint: 'Password', controller: _password),
            ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
