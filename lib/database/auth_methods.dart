import 'package:firebase_auth/firebase_auth.dart';
import 'package:portfolio_admin/screens/widgets/customiz_toast.dart';

class AuthMethods {
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .catchError((obj) {
        errorToast(message: obj.toString());
      });
      final User? user = result.user;
      final User? currentUser = FirebaseAuth.instance.currentUser;
      assert(user!.uid == currentUser!.uid);
      return user;
    } catch (obj) {
      errorToast(message: obj.toString());
      return null;
    }
  }
}
