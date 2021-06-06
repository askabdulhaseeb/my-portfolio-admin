import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DeveloperFirebaseMethods {
  static const String _collection = 'developers';
  addDeveloper(
      {required String uid, required Map<String, dynamic> info}) async {
    await FirebaseFirestore.instance
        .collection(_collection)
        .doc(uid)
        .set(info)
        .catchError((e) {
      print(e.toString());
    });
  }
  // storeImageToFirestore(File image) async {
  //   try {
  //     final ref = FirebaseStorage.instance.ref(
  //         'developers/${DateTime.now().millisecondsSinceEpoch.toString() + basename(image.name)}');

  //     var task = ref.putFile(image.);
  //     if (task == null) return;
  //     final snapshot = await task.whenComplete(() {});
  //     final urlDownload = await snapshot.ref.getDownloadURL();
  //     return urlDownload;
  //   } on FirebaseException catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
